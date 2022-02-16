//
//  ViewController.swift
//  Aula CoreMotion
//
//  Created by Gui Reis on 25/08/21.
//

import UIKit
import CoreMotion
import AVFoundation

class ViewController: UIViewController {
    let myView = MenuView()
    let motion = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = self.myView
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("Mexeu meu camarada!")
            if self.motion.isAccelerometerActive {
                self.motion.stopAccelerometerUpdates()
                self.toggleFlash()
            }
            else {
                self.startAccelerometers()
                self.toggleFlash()
                
            }
        }
    }
    
    
    func toggleFlash() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { return }

        do {
            try device.lockForConfiguration()

            if (device.torchMode == AVCaptureDevice.TorchMode.on) {
                device.torchMode = AVCaptureDevice.TorchMode.off
            } else {
                do {
                    try device.setTorchModeOn(level: 1.0)
                } catch {
                    print(error)
                }
            }

            device.unlockForConfiguration()
        } catch {
            print(error)
        }
    }
    
    
    private func startAccelerometers() -> Void {
        // Make sure the accelerometer hardware is available.
        if self.motion.isAccelerometerAvailable {
            
            
            
            
            self.motion.accelerometerUpdateInterval = 0.6
            self.motion.startAccelerometerUpdates()
            // Configure a timer to fetch the data.
          
            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { _ in
                // Get the accelerometer data.
                if let data = self.motion.accelerometerData {
                    let x = String(format: "X = %.6f", data.acceleration.x)
                    let y = String(format: "Y = %.6f", data.acceleration.y)
                    let z = String(format: "Z = %.6f", data.acceleration.z)
                    print("\(x)    \(y)    \(z)")
                    
                    self.myView.setTextLabels(list: [x, y, z])
                    
                    if (self.motion.isAccelerometerActive) {
                        self.myView.setStatusLabel(text: "Em processo")
                    } else {
                        self.myView.setStatusLabel(text: "Parado")
                    }
                    // Use the accelerometer data in your app
                }
            }
        }
    }
    
}
