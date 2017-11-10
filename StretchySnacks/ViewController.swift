//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Carlo Namoca on 2017-11-09.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navHeightCon: NSLayoutConstraint!
    
    var snackySnacks = [String]()
    
    var navBarOn = Bool()
    var stackView = UIStackView()
    
    var image1 = UIImageView()
    var image2 = UIImageView()
    var image3 = UIImageView()
    var image4 = UIImageView()
    var image5 = UIImageView()
    
    var navBarLabel = UILabel()
    
    var labelYCon = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarOn = true
        stackView.isHidden = true
        setupStackView()
        setupTap()
        
        navBarLabel.translatesAutoresizingMaskIntoConstraints = false

        navBarLabel.text = "SNACKZ"
        self.navBar.addSubview(navBarLabel)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        navBarLabel.centerXAnchor.constraint(equalTo: navBar.centerXAnchor).isActive = true
        labelYCon = navBarLabel.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: 0)
        labelYCon.isActive = true
    }
    
    //MARK: tableview 🐮💩
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let string = snackySnacks[indexPath.row]
        cell.textLabel?.text = string
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snackySnacks.count
    }
    
    //MARK: navBar conditions
    
    @IBAction func stretchNav(_ sender: UIButton) {
        if navBarOn
        {
            push()
            navBarOn = false
            stackView.isHidden = false
            navBarLabel.text = "ADD THE SNACKZ"
            navBarLabel.translatesAutoresizingMaskIntoConstraints = false
//            navBarLabel.centerXAnchor.constraint(equalTo: navBar.centerXAnchor).isActive = true
            labelYCon.isActive = false
            labelYCon = navBarLabel.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: -50)
            labelYCon.isActive = true
            
        }
        else
        {
            pull()
            navBarOn = true
            stackView.isHidden = true
            navBarLabel.text = "SNACKZ"
            navBarLabel.translatesAutoresizingMaskIntoConstraints = false
//            navBarLabel.centerXAnchor.constraint(equalTo: navBar.centerXAnchor).isActive = true
            labelYCon.isActive = false
            labelYCon = navBarLabel.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: 0)
            labelYCon.isActive = true
        }
        
        self.view.layoutIfNeeded()
    }
    
    //MARK: navBar animations
    func push() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveLinear, animations:  {
            self.navHeightCon.constant = 200
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        UIView.animate(withDuration: 0.2, animations: {
            self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        })
    }
    
    func pull() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveLinear, animations:  {
            self.navHeightCon.constant = 64
            self.view.layoutIfNeeded()
        }, completion: nil)
        UIView.animate(withDuration: 0.2, animations: {
            self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        })
    }
    
    //MARK: Adding snackies method
    
    
    
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
        
        image1.image = #imageLiteral(resourceName: "oreos")
        stackView.addArrangedSubview(image1)
//        image1.translatesAutoresizingMaskIntoConstraints = false
////        image1.widthAnchor.constraint(equalToConstant: 67).isActive = true
////        image1.heightAnchor.constraint(equalToConstant: self.stackView.frame.height).isActive = true
//        image1.heightAnchor.constraint(equalTo: self.stackView.heightAnchor).isActive = true
//        image1.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor, constant: 0)

        image2.image = #imageLiteral(resourceName: "pop_tarts")
        stackView.addArrangedSubview(image2)
//        image2.translatesAutoresizingMaskIntoConstraints = false
////        image2.widthAnchor.constraint(equalToConstant: 67).isActive = true
//        image2.heightAnchor.constraint(equalTo: self.stackView.heightAnchor).isActive = true
////        image2.leadingAnchor.constraint(equalTo: image1.trailingAnchor, constant: 0)

        image3.image = #imageLiteral(resourceName: "pizza_pockets")
        stackView.addArrangedSubview(image3)
//        image3.translatesAutoresizingMaskIntoConstraints = false
////        image3.widthAnchor.constraint(equalToConstant: 67).isActive = true
//        image3.heightAnchor.constraint(equalTo: self.stackView.heightAnchor).isActive = true
////        image3.leadingAnchor.constraint(equalTo: image2.trailingAnchor, constant: 0)

        image4.image = #imageLiteral(resourceName: "popsicle")
        stackView.addArrangedSubview(image4)
//        image4.translatesAutoresizingMaskIntoConstraints = false
////        image4.widthAnchor.constraint(equalToConstant: 67).isActive = true
////        image4.heightAnchor.constraint(equalTo: self.stackView.heightAnchor).isActive = true
////        image4.leadingAnchor.constraint(equalTo: image3.trailingAnchor, constant: 0)

        image5.image = #imageLiteral(resourceName: "ramen")
        stackView.addArrangedSubview(image5)
//        image5.translatesAutoresizingMaskIntoConstraints = false
////        image5.widthAnchor.constraint(equalToConstant: 67).isActive = true
////        image5.heightAnchor.constraint(equalTo: self.stackView.heightAnchor).isActive = true
////        image5.leadingAnchor.constraint(equalTo: image4.trailingAnchor, constant: 0)
//        image5.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor, constant: 0).isActive = true
    }
    
    //MARK: Setup tapzzzz
    
    func setupTap() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        image1.isUserInteractionEnabled = true
        image1.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        image2.isUserInteractionEnabled = true
        image2.addGestureRecognizer(tapGestureRecognizer2)
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        image3.isUserInteractionEnabled = true
        image3.addGestureRecognizer(tapGestureRecognizer3)
        
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        image4.isUserInteractionEnabled = true
        image4.addGestureRecognizer(tapGestureRecognizer4)
        
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        image5.isUserInteractionEnabled = true
        image5.addGestureRecognizer(tapGestureRecognizer5)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if tappedImage == image1 {
            let string = "oreos"
            snackySnacks.append(string)
            self.tableView.reloadData()
        } else if tappedImage == image2 {
            let string = "pop tarts"
            snackySnacks.append(string)
            self.tableView.reloadData()
        } else if tappedImage == image3 {
            let string = "pizza pockets"
            snackySnacks.append(string)
            self.tableView.reloadData()
        } else if tappedImage == image4 {
            let string = "popsickle"
            snackySnacks.append(string)
            self.tableView.reloadData()
        } else if tappedImage == image5 {
            let string = "issa ramen"
            snackySnacks.append(string)
            self.tableView.reloadData()
        }
    }
}

