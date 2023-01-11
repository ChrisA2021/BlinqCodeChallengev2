//
//  PresentationHelper.swift
//  BlinqCodeChallengev2
//
//  Created by Chrishane Amarasekara on 11/1/2023.
//

import UIKit

extension UISheetPresentationController.Detent.Identifier {
    static let small = UISheetPresentationController.Detent.Identifier("small")
}

class PresentationHelper {
    
    static let sharedInstance = PresentationHelper()
    var largestUndimmedDetentIdentifier: UISheetPresentationController.Detent.Identifier = .medium
    var prefersScrollingExpandsWhenScrolledToEdge: Bool = false
    var prefersEdgeAttachedInCompactHeight: Bool = true
    var widthFollowsPreferredContentSizeWhenEdgeAttached: Bool = true
}
