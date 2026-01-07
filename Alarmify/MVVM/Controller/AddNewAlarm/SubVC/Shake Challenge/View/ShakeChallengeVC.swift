//
//  ShakeChallengeVC.swift
//  Alarmify
//
//  Created by iMac on 05/01/26.
//

import UIKit
import CoreMotion

class ShakeChallengeVC: UIViewController {

    @IBOutlet weak var bottomBgView: UIView!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var shakeForceSlider: UISlider!
    
    let motionManager = CMMotionManager()
    
    var requiredTime: Int = 10
    var requiredForce: Double = 3
    
    var shakeTimer: Timer?
    var currentShakeTime = 0
    var isShaking = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomBgView.layer.cornerRadius = 22
        bottomBgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        setupSliders()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedSave(_ sender: Any) {
    }
    @IBAction func tappedPreview(_ sender: Any) {
    }
    
    @IBAction func tappedTimeSlider(_ sender: UISlider) {
        let stepped = round(sender.value)
        sender.value = stepped
        requiredTime = Int(stepped)
        updateLabels()
    }
    
    @IBAction func tappedShakeSlider(_ sender: UISlider) {
        let stepped = round(sender.value)
        sender.value = stepped
        requiredForce = Double(stepped)
    }
    
    // MARK: - Setup
    func setupSliders() {
        timeSlider.minimumValue = 5
        timeSlider.maximumValue = 20   // ✅ MAX 20 SECONDS
        timeSlider.value = Float(requiredTime)
        
        shakeForceSlider.minimumValue = 1
        shakeForceSlider.maximumValue = 5
        shakeForceSlider.value = Float(requiredForce)
        
        updateLabels()
    }
    
    func updateLabels() {
        secondsLabel.text = "\(requiredTime) Seconds"
    }
    
    // MARK: - Shake Detection
    
    func startShakeDetection() {
        currentShakeTime = 0
        isShaking = false
        
        guard motionManager.isAccelerometerAvailable else { return }
        
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: .main) { data, error in
            guard let acc = data?.acceleration else { return }
            
            let force = sqrt(acc.x * acc.x + acc.y * acc.y + acc.z * acc.z)
            
            if force > self.requiredForce {
                self.handleShakeDetected()
            }
        }
    }
    
    func stopShakeDetection() {
        motionManager.stopAccelerometerUpdates()
        shakeTimer?.invalidate()
        shakeTimer = nil
    }
    
    func handleShakeDetected() {
        if !isShaking {
            isShaking = true
            
            shakeTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.currentShakeTime += 1
                
                if self.currentShakeTime >= self.requiredTime {
                    self.shakeCompleted()
                }
            }
        }
    }
    
    func shakeCompleted() {
        stopShakeDetection()
        
        let alert = UIAlertController(title: "Success 🎉", message: "Alarm Stopped!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
