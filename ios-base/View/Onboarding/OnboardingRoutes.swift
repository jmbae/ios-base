//
//  OnboardingRoutes.swift
//  ios-base
//
//  Created by Mauricio Cousillas on 6/13/19.
//  Copyright © 2019 TopTier labs. All rights reserved.
//

import Foundation
import UIKit

enum OnboardingRoutes: Route {
  case firstScreen
  case signIn
  case signUp

  var screen: UIViewController {
    switch self {
    case .firstScreen:
      return buildFirstViewController()
    case .signIn:
      return buildSignInViewController()
    case .signUp:
      return buildSignUpViewController()
    }
  }

  private func buildSignInViewController() -> UIViewController {
    guard let signIn = UIStoryboard
      .instantiateViewController(SignInViewController.self)
      else {
        return UIViewController()
    }
    signIn.viewModel = SignInViewModelWithCredentials()
    return signIn
  }

  private func buildSignUpViewController() -> UIViewController {
    guard let signUp = UIStoryboard
      .instantiateViewController(SignUpViewController.self)
      else {
        return UIViewController()
    }
    signUp.viewModel = SignUpViewModelWithEmail()
    return signUp
  }

  private func buildFirstViewController() -> UIViewController {
    guard let first = UIStoryboard
      .instantiateViewController(FirstViewController.self)
      else {
        return UIViewController()
    }
    first.viewModel = FirstViewModel()
    return first
  }
}
