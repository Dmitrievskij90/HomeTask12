//
//  ViewController.swift
//  HomeTask12.3
//
//  Created by Konstantin Dmitrievskiy on 02.04.2021.
//

import UIKit

class ViewController: UIViewController {
    private var index = 0
    private var dishes = [UIImage(named: "basil"), UIImage(named: "jalapeno"), UIImage(named: "peperoni")]
    private var dishName = ["Cheese and basil", "Chicken and jalapeno", "Peperoni"]
    private var dishView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    private var nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
    private var backgroundView = UIImageView()

    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view

        backgroundView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        backgroundView.center.x = view.center.x
        backgroundView.center.y = view.center.y - 300
        backgroundView.image = dishes[index]
        backgroundView.alpha = 0.3
        backgroundView.contentMode = .scaleAspectFit
        view.addSubview(backgroundView)

        dishView.center.x = view.center.x
        dishView.center.y = view.center.y - 100
        dishView.image = dishes[index]
        dishView.contentMode = .scaleAspectFit
        view.addSubview(dishView)

        nameLabel.center.x = view.center.x
        nameLabel.center.y = view.center.y + 100
        nameLabel.text = dishName[index]
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont(name: "GillSans-LightItalic", size: 50)
        view.addSubview(nameLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_ :)))
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_ :)))
        swipeGestureLeft.direction = .left
        swipeGestureRight.direction = .right
        view.addGestureRecognizer(swipeGestureLeft)
        view.addGestureRecognizer(swipeGestureRight)
    }

    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .left:
                index += 1
                checkIndex()
                dishView.transform = CGAffineTransform(translationX: 300, y: 0)
                dishView.transform = dishView.transform.rotated(by: .pi)
                backgroundView.alpha = 0
                nameLabel.alpha = 0
                applyAnimation()
            case .right:
                index -= 1
                checkIndex()
                dishView.transform = CGAffineTransform(translationX: -300, y: 0)
                dishView.transform = dishView.transform.rotated(by: .pi)
                backgroundView.alpha = 0
                nameLabel.alpha = 0
                applyAnimation()
            default:
                break
            }
        }
    }

    func checkIndex() {
        if index >= dishes.count {
            index = 0
        } else if index <= -1 {
            index = dishes.count - 1
        }
        upDateUI()
    }

    func upDateUI() {
        dishView.image = dishes[index]
        backgroundView.image = dishes[index]
        nameLabel.text = dishName[index]
    }

    func applyAnimation() {
        UIView.animate(withDuration: 1.0) {
            self.dishView.transform = CGAffineTransform(rotationAngle: .pi * 2.0)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.backgroundView.alpha = 0.3
                self.nameLabel.alpha = 1
            }
        }
    }
}
