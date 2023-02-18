//
//  BaseViewController.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import UIKit

extension UIView {
    static func loadView() -> Self {
        return self.init(frame: UIScreen.main.bounds)
    }
}

class BaseViewController<View: UIView>: UIViewController {
    
    var rootView: View { view as! View }
    
    override func loadView() {
        view = View.loadView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        subscribeOnKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        unsubscribeFromKeyboardNotifications()
    }
    
    private func subscribeOnKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(notificationKeyboard),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationKeyboard),
                                               name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationKeyboard),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationKeyboard),
                                               name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    private func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func notificationKeyboard(notification: Notification) {
        guard let userInfo: Dictionary = notification.userInfo else { return }
        
        // swiftlint:disable force_cast
        let endFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        let keyboardEndFrame = endFrameValue.cgRectValue // view.convert(endFrameValue.cgRectValue, from: view.window)
        
        // swiftlint:disable force_cast
        let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration: TimeInterval = durationValue.doubleValue
        
        // swiftlint:disable force_cast
        let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = UIView.AnimationOptions(rawValue: UInt(curveValue.uint32Value << 16))
        
        switch notification.name {
        case UIResponder.keyboardWillShowNotification:
            keyboardWillShowWithFrame(keyboardEndFrame,
                                      duration: animationDuration,
                                      options: [.beginFromCurrentState, animationCurve])
        case UIResponder.keyboardDidShowNotification:
            keyboardDidShowWithFrame(keyboardEndFrame)
        case UIResponder.keyboardWillHideNotification:
            keyboardWillHideWithFrame(keyboardEndFrame,
                                      duration: animationDuration,
                                      options: [.beginFromCurrentState, animationCurve])
        case UIResponder.keyboardDidHideNotification:
            keyboardDidHideWithFrame(keyboardEndFrame)
        default: break
        }
    }
    
    func keyboardWillShowWithFrame(_ frame: CGRect, duration: TimeInterval, options: UIView.AnimationOptions) {
        let newHeight = frame.height - view.safeAreaInsets.bottom
        keyboadHeightDidChange(with: newHeight, duration: duration, options: options)
    }
    
    func keyboardDidShowWithFrame(_ frame: CGRect) {
        
    }
    
    func keyboardWillHideWithFrame(_ frame: CGRect, duration: TimeInterval, options: UIView.AnimationOptions) {
        let newHeight = frame.height - view.safeAreaInsets.bottom
        keyboadHeightDidChange(with: -newHeight, duration: duration, options: options)
    }
    
    func keyboardDidHideWithFrame(_ frame: CGRect) {
        
    }
    
    func keyboadHeightDidChange(with keyboardHeight: CGFloat,
                                duration: TimeInterval,
                                options: UIView.AnimationOptions) {
        
    }
    
}
