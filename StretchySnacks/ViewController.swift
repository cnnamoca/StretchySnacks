//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Carlo Namoca on 2017-11-09.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var navBarOn = Bool()
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarOn = true
        stackView.isHidden = true
        
        setupStackView()
    }
    
    //MARK: tableview 🐮💩
    
    
    
    //MARK: navBar conditions
    
    @IBAction func stretchNav(_ sender: UIButton) {
        if navBarOn
        {
            push()
            navBarOn = false
            stackView.isHidden = false
        }
        else
        {
            pull()
            navBarOn = true
            stackView.isHidden = true
        }
    }
    
    //MARK: navBar animations
    func push() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveLinear, animations:  {
            self.navBar.frame = CGRect(x: 0, y: 0, width: self.navBar.frame.width, height: 200)
        }, completion: nil)
        UIView.animate(withDuration: 0.2, animations: {
            self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        })
    }
    
    func pull() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveLinear, animations:  {
            self.navBar.frame = CGRect(x: 0, y: 0, width: self.navBar.frame.width, height: 66)
        }, completion: nil)
        UIView.animate(withDuration: 0.2, animations: {
            self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        })
    }
    
    //MARK: StackView setup
    
    func setupStackView() {
        //add stackview
        self.navBar.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalToConstant: self.navBar.frame.width).isActive = true
        stackView.topAnchor.constraint(equalTo: self.navBar.topAnchor, constant: 64).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: self.navBar.bottomAnchor, constant: 0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackView.axis = UILayoutConstraintAxis.horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        let image1 = UIImageView()
        image1.image = #imageLiteral(resourceName: "oreos")
        stackView.addArrangedSubview(image1)
//        image1.translatesAutoresizingMaskIntoConstraints = false
////        image1.widthAnchor.constraint(equalToConstant: 67).isActive = true
////        image1.heightAnchor.constraint(equalToConstant: self.stackView.frame.height).isActive = true
//        image1.heightAnchor.constraint(equalTo: self.stackView.heightAnchor).isActive = true
//        image1.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor, constant: 0)
//
        let image2 = UIImageView()
        image2.image = #imageLiteral(resourceName: "pop_tarts")
        stackView.addArrangedSubview(image2)
//        image2.translatesAutoresizingMaskIntoConstraints = false
////        image2.widthAnchor.constraint(equalToConstant: 67).isActive = true
//        image2.heightAnchor.constraint(equalTo: self.stackView.heightAnchor).isActive = true
////        image2.leadingAnchor.constraint(equalTo: image1.trailingAnchor, constant: 0)
//
        let image3 = UIImageView()
        image3.image = #imageLiteral(resourceName: "pizza_pockets")
        stackView.addArrangedSubview(image3)
//        image3.translatesAutoresizingMaskIntoConstraints = false
////        image3.widthAnchor.constraint(equalToConstant: 67).isActive = true
//        image3.heightAnchor.constraint(equalTo: self.stackView.heightAnchor).isActive = true
////        image3.leadingAnchor.constraint(equalTo: image2.trailingAnchor, constant: 0)
//
        let image4 = UIImageView()
        image4.image = #imageLiteral(resourceName: "popsicle")
        stackView.addArrangedSubview(image4)
//        image4.translatesAutoresizingMaskIntoConstraints = false
////        image4.widthAnchor.constraint(equalToConstant: 67).isActive = true
////        image4.heightAnchor.constraint(equalTo: self.stackView.heightAnchor).isActive = true
////        image4.leadingAnchor.constraint(equalTo: image3.trailingAnchor, constant: 0)
//
        let image5 = UIImageView()
        image5.image = #imageLiteral(resourceName: "ramen")
        stackView.addArrangedSubview(image5)
//        image5.translatesAutoresizingMaskIntoConstraints = false
////        image5.widthAnchor.constraint(equalToConstant: 67).isActive = true
////        image5.heightAnchor.constraint(equalTo: self.stackView.heightAnchor).isActive = true
////        image5.leadingAnchor.constraint(equalTo: image4.trailingAnchor, constant: 0)
//        image5.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor, constant: 0).isActive = true
    }
}

