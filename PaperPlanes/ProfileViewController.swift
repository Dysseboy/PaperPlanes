//
//  ProfileViewController.swift
//  
//
//  Created by Alexander Tofilovski on 2018-01-12.
//

import UIKit
import PureLayout

class ProfileViewController: UIViewController, UITextFieldDelegate, UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        navigationItem.title = "Profile"
        //navigationItem.leftBarButtonItem =
        
        addSubview()
        addConstraints()
        loadData()
        
        emailField.delegate = self
        mobileField.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Initiation
    
    func addSubview(){
        //add the subviews here
        if adminView == 1 {
            self.view.addSubview(editButton)
            if editStat == 0 {
                
            }
        }
        self.view.addSubview(profilePicture)
        self.view.addSubview(nameLabel)
        self.view.addSubview(karmaField)
        self.view.addSubview(mobileTag)
        self.view.addSubview(mobileField)
        self.view.addSubview(emailTag)
        self.view.addSubview(emailField)
        self.view.addSubview(jobField)
    }
    
    func addConstraints(){
        //add constarints
        profilePicture.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        profilePicture.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
        nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 200)
        nameLabel.autoPinEdge(toSuperviewEdge: .top,withInset: 120)
        jobField.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 3)
        jobField.autoPinEdge(toSuperviewEdge: .left, withInset: 200)
        karmaField.autoPinEdge(toSuperviewEdge: .left, withInset: 200)
        karmaField.autoPinEdge(.top, to: .bottom, of:jobField, withOffset: 8)
        mobileTag.autoPinEdge(.top, to: .bottom, of: profilePicture, withOffset: 30)
        mobileTag.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        mobileField.autoPinEdge(.top, to: .bottom, of: mobileTag, withOffset: 8)
        mobileField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        emailTag.autoPinEdge(.top, to: .bottom, of: mobileField, withOffset: 8)
        emailTag.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        emailField.autoPinEdge(.top, to: .bottom, of: emailTag, withOffset: 8)
        emailField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        if adminView == 1 {
            editButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 100)
            editButton.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
            if editStat == 1{
                
            }
        }
        
        
    }
    
    
    //MARK: TextFieald Delegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        if adminView == 1{
            return true
        } else {
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    */
    lazy var titelText: UINavigationItem = {
        let text = UINavigationItem()
        text.title = "Profile"
        return text
    }()
    
    lazy var navBack: UINavigationItem = {
        var botton = UINavigationItem()
        
        
        return botton
    }()
    
    //MARK: UI
    
    
    lazy var profilePicture: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Avatar.jpg"))
        imageView.autoSetDimensions(to: CGSize(width: 150  , height: 150))
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Avatar.jpg"), for: .normal)
        button.imageView?.layer.cornerRadius = 50
        button.layer.cornerRadius = 50
        button.autoSetDimension(.width, toSize: 100)
        button.autoSetDimension(.height, toSize: 100)
        button.addTarget(self, action: #selector(editProfileData(sender:)), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 0.5
       
        return button
    }()
    

    lazy var nameLabel: UILabel = {
        let text = UILabel()
        text.text = firstName + " " + lastName
        text.font = UIFont(name: "Palationo", size: 32)
        text.font = UIFont.preferredFont(forTextStyle: .headline)
        return text
    }()
    
    lazy var karmaField: UILabel = {
        let text = UILabel()
        text.text = String(karmaCount)
        text.layer.backgroundColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 3
        text.textColor = UIColor.orange
        return text
    }()
    
    lazy var mobileTag: UILabel = {
        let text = UILabel()
        text.text = "Mobile"
        return text
    }()
    
    lazy var mobileField: UITextField = {
        let text = UITextField()
        text.placeholder = "+46 73-523 44 51"
        enum UITextBorderStyle {
            case none
        }
        text.keyboardType = UIKeyboardType.namePhonePad
        text.returnKeyType = UIReturnKeyType.done
        return text
    }()
    
    lazy var emailTag: UILabel = {
        let text = UILabel()
        text.text = "E-mail"
        return text
    }()
    
    lazy var emailField: UITextField = {
        let text = UITextField()
        text.placeholder = "arne.kvarn@internet.global"
        enum UITextBorderStyle {
            case none
        }
        text.keyboardType = UIKeyboardType.emailAddress
        text.returnKeyType = UIReturnKeyType.done
        return text
    }()
    
    lazy var jobField: UILabel = {
        let text = UILabel()
        text.text = "Destributer"
        return text
    }()
    
    lazy var editAnimation: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    
    
 
    //MARK: Proprties
    
    @objc private func editProfileData(sender: UIButton){
        //add images next to fields and chang editbutton image to save image, enable fields
        switch editStat{
        case 0:
            editButton.setImage(UIImage(named: "avatar.jpg"), for: .normal)
            editStat = 1
        case 1:
            editButton.setImage(UIImage(named: "Avatar.jpg"), for: .normal)
            editStat = 0
        default:
            fatalError("You dont have promittion")
        }
        
    }
    //Some debuging code and trys to chande ViewController
    @objc func addKarma(sender: UIButton){
        /*
        karmaCount += 1
        karmaField.text = " + " + String(karmaCount) + " "
        */
        //Changes the view (need to fix animation with UIModa)
        let setNewView = ViewController()
        present(setNewView, animated: true, completion: nil)

        
    }
    
    
    //MARK: Data
    
    //Some test data
    let firstName = "Arne"
    let lastName = "Kvarn"
    var karmaCount = 0
    var mobilelNumber = "+46 73 534 76 24"
    var emailAdress = "mr.World_Wild@internet.global"
    let jobName = "Distributor"
    var editStat = 0
    
    //To test diffent layouts for viewing and for editing. 1 = admin, 0 = viewer
    var adminView = 1
    
    //Load data
    func loadData(){
        mobileField.text = mobilelNumber
        emailField.text = emailAdress
        jobField.text = jobName
    }
    
    
 


}
