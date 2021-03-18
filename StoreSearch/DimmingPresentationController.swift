//
//  DimmingPresentationController.swift
//  StoreSearch
//
//  Created by Кирилл Дутов on 17.03.2021.
//

import UIKit

class DimmingPresentationController: UIPresentationController {
    
    // Создаем объект GradientView, делаем его размером с containerView и вставляем его за всем остальным
    
    lazy var dimmingView = GradientView(frame: CGRect.zero)
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView!.bounds
        containerView!.insertSubview(dimmingView, at: 0)
        
        // Устанавливаем и анимируем градиент
        dimmingView.alpha = 0
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1
            }, completion: nil)
        }
    }
    
    override var shouldRemovePresentersView: Bool {
        return false
    }
    
    // Анимируем градиент вне поля зрения при закрытии всплыващего окна
    override func dismissalTransitionWillBegin()  {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0
            }, completion: nil)
        }
    }
}

extension DetailViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController)
    -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
