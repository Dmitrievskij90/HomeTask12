//
//  ViewController.swift
//  HomeTask12.1
//
//  Created by Konstantin Dmitrievskiy on 30.03.2021.
//

import UIKit

class ViewController: UIViewController {
    private var circleView = UIImageView()
    private var rectangleView = UIImageView()

    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view

        rectangleView.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        rectangleView.center = view.center
        rectangleView.image = UIImage(named: "board")
        rectangleView.contentMode = .scaleToFill

        circleView.image = UIImage(named: "pizza")
        circleView.contentMode = .scaleAspectFit
        circleView.frame = CGRect(x: rectangleView.frame.origin.x, y: rectangleView.frame.origin.y, width: 110, height: 110)

        view.addSubview(rectangleView)
        view.addSubview(circleView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(animateView), userInfo: nil, repeats: true)
        timer.fire()
    }

    @objc func animateView() {
        UIView.animate(withDuration: 2.0, delay: 0.0, options: []) {
            self.circleView.transform = CGAffineTransform(translationX: 200, y: 0)
        } completion: { _ in
            UIView.animate(withDuration: 2.0, delay: 0.0, options: []) {
                self.circleView.transform = CGAffineTransform(translationX: 200, y: 100)
            } completion: { _ in
                UIView.animate(withDuration: 2.0, delay: 0.0, options: []) {
                    self.circleView.transform = CGAffineTransform(translationX: 0, y: 100)
                } completion: { _ in
                    UIView.animate(withDuration: 2.0, delay: 0.0, options: []) {
                        self.circleView.transform = CGAffineTransform(translationX: 0, y: 0)
                    } completion: { _ in
                    }
                }
            }
        }
    }
}
