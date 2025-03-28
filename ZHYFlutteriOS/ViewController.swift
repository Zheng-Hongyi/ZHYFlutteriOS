//
//  ViewController.swift
//  ZHYFlutteriOS
//
//  Created by 郑洪毅 on 2025/3/28.
//

import UIKit
import Flutter
import SnapKit

class ViewController: UIViewController {
    
    var _flutterViewController: FlutterViewController?
    var channel: FlutterBasicMessageChannel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let engine =  FlutterManager.shared.engine(for: "zhy1")
        engine.run()
        var flutterViewController = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        _flutterViewController = flutterViewController
        if let flutterView = _flutterViewController?.view {
            self.view.addSubview(flutterView)
            flutterView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        channel = FlutterBasicMessageChannel(
            name: "com.example/basic_message_channel",
            binaryMessenger: flutterViewController.registrar(forPlugin: "BasicMessageChannelHandler")!.messenger(),
            codec: FlutterStringCodec.sharedInstance()
        )
        // 2. 设置消息处理器（接收 Flutter 消息并回复）
        if let aChannel = channel {
            aChannel.setMessageHandler { (message, reply) in
                guard let message = message as? String else {
                    reply(FlutterError(code: "INVALID_ARG", message: "无效消息", details: nil))
                    return
                }
                print("收到 Flutter 消息: \(message)")
                // 处理消息并回复
                let response = "iOS 回复: \(message.uppercased())"
                reply(response)
            }
            // 3. 主动发送消息到 Flutter（可选）
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                aChannel.sendMessage("223") { reply in
                    if let reply = reply as? String {
                        print("Flutter 回复: \(reply)")
                    }
                }
            }
            
        }
    }
}

