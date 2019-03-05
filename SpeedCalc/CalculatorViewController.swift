//
//  CalculatorViewController.swift
//  SpeedCalc
//
//  Created by Cameron Milliken on 1/8/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

// Add Solve A Mystery
// Create an array of images
// a function to call that will randomly choose an image.
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addAllSubviews()
        constrainLabelStackView()
        constrainBGImageView()
        constrainButtonStackVIew()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateButton()
    }
    
    //Background Image Array
    let images = [
        "roadTrip",
        "roadTrip2",
        "roadTrip4",
        "roadTrip5",
        "roadTrip6",
        "roadTrip7",
        "roadTrip8"
        
    ]
    // Random image on start up.
    func randomImage() -> UIImage {
        let idx = Int(arc4random_uniform(UInt32(images.count)))
        guard let image = UIImage(named: images[idx]) else { fatalError() }
        
        return image
    }
    
    
    func setupView() {
        bgImageView.image = randomImage()
        
    }
    
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    //Clears the textfields when you shake your phone.
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            mphTextField.text = ""
            distanceTextField.text = ""
            timeTextField.text = ""
        }
    }
    
    let bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
//        imageView.image = #imageLiteral(resourceName: "roadTrip4")
        return imageView
    }()
    
    // Labels
    var distanceTextField: UITextField = {
        let textField = UITextField()
        textField.contentMode = .scaleToFill
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        textField.textColor = .black
        textField.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.8492883134)

        textField.placeholder = "Distance in miles"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    var timeTextField: UITextField = {
        let textField = UITextField()
        textField.contentMode = .scaleToFill
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        textField.textColor = .black
        textField.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.8539972175)
        
        textField.placeholder = "Hours To Destination"
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true

        return textField
    }()
    
    var mphTextField: UITextField = {
        let textField = UITextField()
        textField.contentMode = .scaleToFill
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        textField.textColor = .black
        textField.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.8544788099)
        textField.placeholder = "Your Speed"
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        return textField
    }()
    
    let getMilageButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET MILES", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 0.7990956764)
        button.showsTouchWhenHighlighted = true
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    let getTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET TIME", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 0.7950288955)
        button.showsTouchWhenHighlighted = true
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    let getSpeedButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET SPEED", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 0.8549604024)
        button.showsTouchWhenHighlighted = true
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    //Animations
    func animateButton() {
        
        self.distanceTextField.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animateKeyframes(withDuration: 2, delay: 1.75, options: [], animations: {
            self.distanceTextField.transform = .identity
        }, completion: nil)
        
        self.timeTextField.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animateKeyframes(withDuration: 2, delay: 1.5, options: [], animations: {
            self.timeTextField.transform = .identity
        }, completion: nil)
        
        self.mphTextField.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animateKeyframes(withDuration: 2, delay: 1.25, options: [], animations: {
            self.mphTextField.transform = .identity
        }, completion: nil)
        
        self.cancelButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animateKeyframes(withDuration: 2, delay: 1, options: [], animations: {
            self.cancelButton.transform = .identity
        }, completion: nil)
       
        self.getSpeedButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animateKeyframes(withDuration: 2, delay: 0.75, options: [], animations: {
            self.getSpeedButton.transform = .identity
        }, completion: nil)
        
        self.getTimeButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animateKeyframes(withDuration: 2, delay: 0.5, options: [], animations: {
            self.getTimeButton.transform = .identity
        }, completion: nil)
        
        self.getMilageButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 2, delay: 0.25, options: [], animations: {
            self.getMilageButton.transform = .identity
        }, completion: nil)
    }
    
    
    
    @objc func cancelButton(sender:UIButton!){
        distanceTextField.text = ""
        timeTextField.text = ""
        mphTextField.text = ""
        
    }
    
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("CLEAR", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 0.8014501284)
        button.showsTouchWhenHighlighted = true
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
        
    }()
    
    
    @objc func getSpeedButton(sender: UIButton!) {

//changes the color of the button when tapped.
//        UIView.animate(withDuration: 0.2, delay: 0, options: [.autoreverse], animations: {
//            self.getSpeedButton.backgroundColor = UIColor.darkGray
//        }) { (_) in
//            self.getSpeedButton.backgroundColor = UIColor.lightGray
//        }
        guard let distanceAsString = distanceTextField.text else {return}
        guard let distance = Float(distanceAsString) else {return}
        guard let timeAsString = timeTextField.text else {return}
        guard let time = Float(timeAsString) else {return}
        let speed = distance / time
        mphTextField.text = "\(speed) MPH"
      
        
        }
    @objc func getTimeButton(sender: UIButton!) {
        guard let distanceAsString = distanceTextField.text else {return}
        guard let distance = Float(distanceAsString) else {return}
        guard let mphAsString = mphTextField.text else {return}
        guard let mph = Float(mphAsString) else {return}
        let timeToArrive = distance / mph
        timeTextField.text = "\(timeToArrive) hours"
    }
    
    @objc func getMilageButton(sender: UIButton!) {
        
        guard let timeAsString = timeTextField.text else {return}
        guard let time = Float(timeAsString) else {return}
        guard let mphAsString = mphTextField.text else {return}
        guard let mph = Float(mphAsString) else {return}
        let miles = time * mph
        distanceTextField.text = "\(miles) miles"
    }
    
    var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 35
        return stackView
    }()
    
    var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    func addAllSubviews() {
        self.view.addSubview(bgImageView)
        
        [distanceTextField, timeTextField, mphTextField, cancelButton].forEach{ labelStackView.addArrangedSubview($0)}
        self.view.addSubview(labelStackView)
        cancelButton.addTarget(self, action: #selector(cancelButton(sender:)), for: .touchUpInside)
        
        [getMilageButton, getTimeButton, getSpeedButton].forEach { buttonStackView.addArrangedSubview($0)}
        self.view.addSubview(buttonStackView)
        getMilageButton.addTarget(self, action: #selector(getMilageButton(sender:)), for: .touchUpInside)
        getTimeButton.addTarget(self, action: #selector(getTimeButton(sender:)), for: .touchUpInside)
        getSpeedButton.addTarget(self, action: #selector(getSpeedButton(sender:)), for: .touchUpInside)
        }
    
    
    //Constraints
    
    func constrainLabelStackView() {
      labelStackView.anchor(top: self.view.topAnchor, bottom: nil, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: self.view.frame.height/4, paddingBottom: 0, paddingLeft: 24, paddingRight: 24, width: nil, height: nil)
    }
    
    func constrainButtonStackVIew() {
        buttonStackView.anchor(top: labelStackView.bottomAnchor, bottom: nil, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 35, paddingBottom: 0, paddingLeft: 24, paddingRight: 24, width: nil, height: nil)
    }
    
    func constrainBGImageView(){
        bgImageView.anchor(top: self.view.topAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: nil, height: nil)
    }
    
    
} //end of class
