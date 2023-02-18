//
//  AuthModuleFactory.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

protocol AuthModuleFactory {
    func makeLoginOutput() -> LoginView
    func makeOnboardingOutput() -> OnboardingView
    func makeFillDataUserOutput() -> FillUserDataView
    func makeOTPVerifyOutput() -> OTPVerifyView
}

final class AuthModuleFactoryImpl: AuthModuleFactory {
    
    private let container: DIContainer

    init(container: DIContainer) {
        self.container = container
    }
    
    func makeLoginOutput() -> LoginView {
        let loginModule = LoginViewController<LoginViewImpl>()
        return loginModule
    }
    
    func makeOnboardingOutput() -> OnboardingView {
        let onboardingVC = OnboardingViewController()
        let onbordingModel =  OnboardingModel(onboardingService:  container.resolve(type: OnboardingServiceable.self),
                                              output: onboardingVC)
        onboardingVC.model = onbordingModel
        return onboardingVC
    }
    
    func makeFillDataUserOutput() -> FillUserDataView {
        return FillUserDataViewController<FillUserDataViewImpl>()
    }
    
    func makeOTPVerifyOutput() -> OTPVerifyView {
        return OTPVerifyViewController<OTPVerifyViewImpl>()
    }
}


