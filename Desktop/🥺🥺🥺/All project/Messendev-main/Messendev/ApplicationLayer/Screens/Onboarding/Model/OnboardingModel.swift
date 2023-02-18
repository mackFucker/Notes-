//
//  OnboardingModel.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

protocol OnboardingModelInput {
    func initialize() async
}

protocol OnboardingModelOutput: AnyObject {
    func setPages(pages: [OnboardingPageCodable])
}

final class OnboardingModel: OnboardingModelInput {
    
    private let onboardingService: OnboardingServiceable
    private weak var output: OnboardingModelOutput?
    
    init(onboardingService: OnboardingServiceable,
         output: OnboardingModelOutput) {
        self.onboardingService = onboardingService
        self.output = output
    }
    
    func initialize() async {
        do {
            let pages = try await onboardingService.getOnboardingPages()
            output?.setPages(pages: pages.pages)
        } catch let error {
            Log.error(error)
//            output?.setPages(pages: [OnboardingMainCodable(imageURL: "1", title: "1", subtitle: "1"),
//                                     OnboardingMainCodable(imageURL: "2", title: "2", subtitle: "2"),
//                                     OnboardingMainCodable(imageURL: "3", title: "3", subtitle: "3"),
//                                     OnboardingMainCodable(imageURL: "KARPL SCREEN", title: "KARPL SCREEN", subtitle: "KARPL SCREEN")])
        }
    }
}
