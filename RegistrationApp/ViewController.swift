//
//  ViewController.swift
//  RegistrationApp
//
//  Created by Kashee ram on 9/8/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    var academicHorizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    let fatherCellId = "fatherCellId"
    let motherCellId = "motherCellId"
    let guardianCellId = "guardianCellId"
    let academicCellId = "academicCellId"
    let hostelCellId = "hostelCellId"
    
    var fatherDetails = Dictionary<String,String>()
    var motherDetails = Dictionary<String,String>()
    var guardianDetails = Dictionary<String,String>()
    
    var academicDetails = Dictionary<String,String>()
    var hostelDetails = Dictionary<String,String>()
    
    lazy var scrollView:UIScrollView = {
        let scrollVW = UIScrollView()
        return scrollVW
    }()
    
    lazy var contentView:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var headerLabel:UILabel = {
        let label = UILabel()
        label.text = "Confirm Student Info"
        label.textAlignment = .center
        label.textColor = Colors.headerRGB
        label.font = UIFont.sfDisplayBold(ofSize: 20)
        return label
    }()
    
    lazy var personalImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "success_dark"))
        return imageView
    }()
    
    lazy var personalInfo:UILabel = {
        let label = UILabel()
        label.text = "Personal Info"
        label.textColor = Colors.lightGrayRGB
        label.font = UIFont.sfDisplayBold(ofSize: 16)
        return label
    }()
    
    lazy var firstNameTextFiled:UITextField = {
        let textField = UITextField()
        textField.setTextFiledProperties(placeHolder:"First Name *")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var lastNameTextFiled:UITextField = {
        let textField = UITextField()
        textField.setTextFiledProperties(placeHolder:"Last Name *")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var emailTextFiled:UITextField = {
        let textField = UITextField()
        textField.setTextFiledProperties(placeHolder:"Email *")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var countryCodeTextFiled:UITextField = {
        let textField = UITextField()
        textField.setTextFiledProperties(placeHolder:"(+91)")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var phoneTextFiled:UITextField = {
        let textField = UITextField()
        textField.setTextFiledProperties(placeHolder:"9876543210")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var DOBTextFiled:UITextField = {
        let textField = UITextField()
        textField.setTextFiledProperties(placeHolder:"Date Of Birth *")
        textField.setBottomBorder()
        setRighImageToTextField(textField: textField,image: "calender_dark")
        return textField
    }()
    
    lazy var GenderTextFiled:UITextField = {
        let textField = UITextField()
        textField.setTextFiledProperties(placeHolder:"Gender")
        textField.setBottomBorder()
        setRighImageToTextField(textField: textField,image: "downArrow")
        return textField
    }()
    
    lazy var parentInfoImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "success_dark"))
        return imageView
    }()
    
    lazy var parentInfo:UILabel = {
        let label = UILabel()
        label.text = "Parent Info"
        label.textColor = Colors.lightGrayRGB
        label.font = UIFont.sfDisplayBold(ofSize: 16)
        return label
    }()
    
    lazy var lineLabel:UILabel = {
        let label = UILabel()
        label.text = "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
        label.textColor = Colors.lightGrayRGB
        label.font = UIFont.sfDisplayRegular(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var fatherButton:UIButton = {
        let button = UIButton()
        button.tag = 0
        button.setTitle("FATHER", for: .normal)
        button.setTitleColor(Colors.blackRGB, for: .normal)
        button.titleLabel?.font = UIFont.sfDisplaySemibold(ofSize: 14)
        button.addTarget(self, action: #selector(ViewController.scrollToMenuIndex), for: .touchUpInside)
        return button
    }()
    
    lazy var motherButton:UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setTitle("MOTHER", for: .normal)
        button.setTitleColor(Colors.lightBlackRGB, for: .normal)
        button.titleLabel?.font = UIFont.sfDisplaySemibold(ofSize: 14)
        button.addTarget(self, action: #selector(ViewController.scrollToMenuIndex), for: .touchUpInside)
        return button
    }()
    
    lazy var guardianButton:UIButton = {
        let button = UIButton()
        button.tag = 2
        button.setTitle("GUARDIAN", for: .normal)
        button.setTitleColor(Colors.lightBlackRGB, for: .normal)
        button.titleLabel?.font = UIFont.sfDisplaySemibold(ofSize: 14)
        button.addTarget(self, action: #selector(ViewController.scrollToMenuIndex), for: .touchUpInside)
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .white
        cv.bounces = false
        cv.isPagingEnabled = true
        return cv
    }()
    
    lazy var academicImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "success_dark"))
        return imageView
    }()
    
    lazy var academicInfo:UILabel = {
        let label = UILabel()
        label.text = "Academic & Hostel Info"
        label.textColor = Colors.lightGrayRGB
        label.font = UIFont.sfDisplayBold(ofSize: 16)
        return label
    }()
    
    lazy var academicLineLabel:UILabel = {
        let label = UILabel()
        label.text = "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
        label.textColor = Colors.lightGrayRGB
        label.font = UIFont.sfDisplayRegular(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var academicInfoButton:UIButton = {
        let button = UIButton()
        button.tag = 0
        button.setTitle("ACADEMIC INFO", for: .normal)
        button.setTitleColor(Colors.blackRGB, for: .normal)
        button.titleLabel?.font = UIFont.sfDisplaySemibold(ofSize: 14)
        button.addTarget(self, action: #selector(ViewController.scrollToAcademicMenuIndex), for: .touchUpInside)
        return button
    }()
    
    lazy var hostelInfoButton:UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setTitle("HOSTEL INFO", for: .normal)
        button.setTitleColor(Colors.lightBlackRGB, for: .normal)
        button.titleLabel?.font = UIFont.sfDisplaySemibold(ofSize: 14)
        button.addTarget(self, action: #selector(ViewController.scrollToAcademicMenuIndex), for: .touchUpInside)
        return button
    }()
    
    lazy var academicCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        return cv
    }()
    
    let updateButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.lightBlackRGB
        button.setTitle("DONE", for: .normal)
        button.setTitleColor(Colors.whiteTextRGB, for: .normal)
        button.layer.cornerRadius = 23
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.sfDisplaySemibold(ofSize: 16)
        button.addTarget(self, action: #selector(ViewController.updateInformation), for: .touchUpInside)
        return button
        
    }()
    
    lazy var hostelLineLabel:UILabel = {
        let label = UILabel()
        label.text = "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
        label.textColor = Colors.lightGrayRGB
        label.font = UIFont.sfDisplayRegular(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var parentHorizontalBarView:UIView = {
        let barView = UIView()
        barView.backgroundColor = Colors.blueRGB
        barView.translatesAutoresizingMaskIntoConstraints = false
        return barView
    }()
    
    lazy var academicHorizontalBarView:UIView = {
        let barView = UIView()
        barView.backgroundColor = Colors.blueRGB
        barView.translatesAutoresizingMaskIntoConstraints = false
        return barView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        
        view.backgroundColor = .white
        
        collectionView.alwaysBounceVertical = false
        collectionView.register(FatherInfoCell.self, forCellWithReuseIdentifier: fatherCellId)
        collectionView.register(MotherInfoCell.self, forCellWithReuseIdentifier: motherCellId)
        collectionView.register(GuardianInfoCell.self, forCellWithReuseIdentifier: guardianCellId)
        
        academicCollectionView.register(AcademicInfoCell.self, forCellWithReuseIdentifier: academicCellId)
        academicCollectionView.register(HostelInfoCell.self, forCellWithReuseIdentifier: hostelCellId)
        
        setupViews()
        //        setupparentHorizontalBarView()
    }
    
    var yOriginOfCurrentlySelectedTextField: CGFloat = 0
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {

            if yOriginOfCurrentlySelectedTextField > keyboardSize.origin.y {
                yOriginOfCurrentlySelectedTextField = yOriginOfCurrentlySelectedTextField - keyboardSize.origin.y 
                self.scrollView.setContentOffset(.init(x: 0, y: yOriginOfCurrentlySelectedTextField), animated: true)
            }
            
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {

        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            if yOriginOfCurrentlySelectedTextField < keyboardSize.origin.y {
                yOriginOfCurrentlySelectedTextField = self.scrollView.contentOffset.y - yOriginOfCurrentlySelectedTextField
                self.scrollView.setContentOffset(.init(x: 0, y: yOriginOfCurrentlySelectedTextField > 0 ? yOriginOfCurrentlySelectedTextField : 0), animated: true)
            }
            
        }
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    func setupparentHorizontalBarView() {
        
        contentView.addSubview(parentHorizontalBarView)
        horizontalBarLeftAnchorConstraint = parentHorizontalBarView.centerXAnchor.constraint(equalTo: fatherButton.centerXAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        
        parentHorizontalBarView.bottomAnchor.constraint(equalTo: fatherButton.bottomAnchor).isActive = true
        parentHorizontalBarView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        parentHorizontalBarView.heightAnchor.constraint(equalToConstant: 3).isActive = true
    }
    
    func setupAcademicHorizontalBarView() {
        
        contentView.addSubview(academicHorizontalBarView)
        academicHorizontalBarLeftAnchorConstraint = academicHorizontalBarView.centerXAnchor.constraint(equalTo: academicInfoButton.centerXAnchor)
        academicHorizontalBarLeftAnchorConstraint?.isActive = true
        
        academicHorizontalBarView.bottomAnchor.constraint(equalTo: academicInfoButton.bottomAnchor).isActive = true
        academicHorizontalBarView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        academicHorizontalBarView.heightAnchor.constraint(equalToConstant: 3).isActive = true
    }
    
    func setupViews() {
        
        [headerLabel, scrollView].forEach({ view.addSubview($0) })
        scrollView.addSubview(contentView)
        [personalImageView, personalInfo, firstNameTextFiled, lastNameTextFiled, emailTextFiled, countryCodeTextFiled, phoneTextFiled, DOBTextFiled, GenderTextFiled, parentInfoImageView, parentInfo, lineLabel, collectionView, academicImageView, academicInfo, academicCollectionView, academicLineLabel, updateButton, hostelLineLabel].forEach({ contentView.addSubview($0) })
        
        if #available(iOS 11.0, *) {
            headerLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: 50))
            scrollView.anchor(top: headerLabel.bottomAnchor, leading: headerLabel.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: nil, size: .init(width: view.frame.width, height: 0))
        } else {
            headerLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: 50))
            scrollView.anchor(top: headerLabel.bottomAnchor, leading: headerLabel.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, size: .init(width: view.frame.width, height: 0))
        }
        
        contentView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, size: .init(width: view.frame.width, height: 0))
        
        personalImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        
        personalInfo.anchor(top: personalImageView.topAnchor, leading: personalImageView.trailingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 16), size: .init(width: 0, height: 22))
        
        firstNameTextFiled.anchor(top: personalInfo.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 16, left: 60, bottom: 0, right: 16), size: .init(width: 0, height: 44))
        
        lastNameTextFiled.anchor(top: firstNameTextFiled.bottomAnchor, leading: firstNameTextFiled.leadingAnchor, bottom: nil, trailing: firstNameTextFiled.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 44))
        
        emailTextFiled.anchor(top: lastNameTextFiled.bottomAnchor, leading: firstNameTextFiled.leadingAnchor, bottom: nil, trailing: firstNameTextFiled.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 44))
        
        countryCodeTextFiled.anchor(top: emailTextFiled.bottomAnchor, leading: firstNameTextFiled.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 60, height: 44))
        
        phoneTextFiled.anchor(top: emailTextFiled.bottomAnchor, leading: countryCodeTextFiled.trailingAnchor, bottom: nil, trailing: firstNameTextFiled.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 44))
        
        DOBTextFiled.anchor(top: phoneTextFiled.bottomAnchor, leading: firstNameTextFiled.leadingAnchor, bottom: nil, trailing: firstNameTextFiled.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 44))
        
        GenderTextFiled.anchor(top: DOBTextFiled.bottomAnchor, leading: firstNameTextFiled.leadingAnchor, bottom: nil, trailing: firstNameTextFiled.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 44))
        
        parentInfoImageView.anchor(top: GenderTextFiled.bottomAnchor, leading: personalImageView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 24, left: 0, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        
        parentInfo.anchor(top: parentInfoImageView.topAnchor, leading: parentInfoImageView.trailingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 16), size: .init(width: 0, height: 22))
        
        lineLabel.anchor(top: personalImageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: parentInfoImageView.topAnchor, trailing: nil, padding: .init(top: -4, left: 24, bottom: -4, right: 0), size: .init(width: 4, height: 0))
        
        let stack = UIStackView(arrangedSubviews: [fatherButton, motherButton, guardianButton])
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        contentView.addSubview(stack)
        
        stack.anchor(top: parentInfo.bottomAnchor, leading: firstNameTextFiled.leadingAnchor, bottom: nil, trailing: firstNameTextFiled.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 16), size: .init(width: 0, height: 34))
        
        setupparentHorizontalBarView()
        
        collectionView.anchor(top: parentHorizontalBarView.bottomAnchor, leading: firstNameTextFiled.leadingAnchor, bottom: nil, trailing: firstNameTextFiled.trailingAnchor, padding: .init(top: 22, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 360))
        
        academicImageView.anchor(top: collectionView.bottomAnchor, leading: personalImageView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 24, left: 0, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        
        academicInfo.anchor(top: academicImageView.topAnchor, leading: academicImageView.trailingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 16), size: .init(width: 0, height: 22))
        
        academicLineLabel.anchor(top: parentInfoImageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: academicImageView.topAnchor, trailing: nil, padding: .init(top: -4, left: 24, bottom: -4, right: 0), size: .init(width: 4, height: 0))
        
        let academicStack = UIStackView(arrangedSubviews: [academicInfoButton, hostelInfoButton])
        academicStack.distribution = .fillEqually
        academicStack.axis = .horizontal
        contentView.addSubview(academicStack)
        
        academicStack.anchor(top: academicInfo.bottomAnchor, leading: firstNameTextFiled.leadingAnchor, bottom: nil, trailing: firstNameTextFiled.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 16), size: .init(width: 0, height: 34))
        
        setupAcademicHorizontalBarView()
        
        academicCollectionView.anchor(top: academicStack.bottomAnchor, leading: firstNameTextFiled.leadingAnchor, bottom: nil, trailing: firstNameTextFiled.trailingAnchor, padding: .init(top: 22, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 250))
        
        updateButton.anchor(top: academicCollectionView.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 16, left: 32, bottom: 16, right: 32), size: .init(width: 0, height: 44))
        
        hostelLineLabel.anchor(top: academicImageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: updateButton.topAnchor, trailing: nil, padding: .init(top: -4, left: 24, bottom: 8, right: 0), size: .init(width: 4, height: 0))
        
    }
    
    @objc func updateInformation() {
        view.endEditing(true)
        print(fatherDetails)
        print(motherDetails)
        print(guardianDetails)
        print(academicDetails)
        print(hostelDetails)
        
    }
    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == academicCollectionView {
            return 2
        }
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == academicCollectionView {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: academicCellId, for: indexPath) as! AcademicInfoCell
                cell.registrationIdTextFiled.delegate = self
                cell.courseTextFiled.delegate = self
                cell.streamTextFiled.delegate = self
                cell.joiningYearTextFiled.delegate = self
                cell.currentYearTextFiled.delegate = self
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hostelCellId, for: indexPath) as! HostelInfoCell
                cell.hostelNameTextFiled.delegate = self
                cell.blockNameTextFiled.delegate = self
                cell.roomNumberTextFiled.delegate = self
                return cell
            }
        } else {
            
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fatherCellId, for: indexPath) as! FatherInfoCell
                
                cell.fatherNameTextFiled.delegate = self
                cell.occupationTextFiled.delegate = self
                cell.emailTextFiled.delegate = self
                cell.countryCodeTextFiled.delegate = self
                cell.phoneTextFiled.delegate = self
                cell.addressTextFiled.delegate = self
                cell.cityTextFiled.delegate = self
                cell.pinTextFiled.delegate = self
                return cell
            }else if indexPath.row == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: motherCellId, for: indexPath) as! MotherInfoCell
                
                cell.motherNameTextFiled.delegate = self
                cell.occupationTextFiled.delegate = self
                cell.emailTextFiled.delegate = self
                cell.countryCodeTextFiled.delegate = self
                cell.phoneTextFiled.delegate = self
                cell.addressTextFiled.delegate = self
                cell.cityTextFiled.delegate = self
                cell.pinTextFiled.delegate = self
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: guardianCellId, for: indexPath) as! GuardianInfoCell
                
                cell.guardianNameTextFiled.delegate = self
                cell.occupationTextFiled.delegate = self
                cell.emailTextFiled.delegate = self
                cell.countryCodeTextFiled.delegate = self
                cell.phoneTextFiled.delegate = self
                cell.addressTextFiled.delegate = self
                cell.cityTextFiled.delegate = self
                cell.pinTextFiled.delegate = self
                return cell
            }
        }
        
        
    }
    
    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    @objc func scrollToMenuIndex(sender:UIButton) {
        setupHeaderController(index: sender.tag)
        let indexPath = IndexPath(item: sender.tag, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    @objc func scrollToAcademicMenuIndex(sender:UIButton) {
        setupAcademicHeaderControll(index: sender.tag)
        let indexPath = IndexPath(item: sender.tag, section: 0)
        academicCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if collectionView == scrollView {
            let index = Int(targetContentOffset.pointee.x / scrollView.frame.width)
            setupHeaderController(index: index)
        } else {
            let index = Int(targetContentOffset.pointee.x / scrollView.frame.width)
            setupAcademicHeaderControll(index: index)
        }
    }
    
    func setupHeaderController(index: Int){
        
        if index == 0 {
            let posX = fatherButton.frame.origin.x
            horizontalBarLeftAnchorConstraint?.constant = posX
            fatherButton.setTitleColor(Colors.blackRGB, for: .normal)
            motherButton.setTitleColor(Colors.lightBlackRGB, for: .normal)
            guardianButton.setTitleColor(Colors.lightBlackRGB, for: .normal)
        }else if index == 1 {
            let posX = motherButton.frame.origin.x
            horizontalBarLeftAnchorConstraint?.constant = posX
            fatherButton.setTitleColor(Colors.lightBlackRGB, for: .normal)
            motherButton.setTitleColor(Colors.blackRGB, for: .normal)
            guardianButton.setTitleColor(Colors.lightBlackRGB, for: .normal)
        } else {
            let posX = guardianButton.frame.origin.x
            horizontalBarLeftAnchorConstraint?.constant = posX
            fatherButton.setTitleColor(Colors.lightBlackRGB, for: .normal)
            motherButton.setTitleColor(Colors.lightBlackRGB, for: .normal)
            guardianButton.setTitleColor(Colors.blackRGB, for: .normal)
        }
        
    }
    
    func setupAcademicHeaderControll(index: Int) {
        if index == 0 {
            let posX = academicInfoButton.frame.origin.x
            academicHorizontalBarLeftAnchorConstraint?.constant = posX
            academicInfoButton.setTitleColor(Colors.blackRGB, for: .normal)
            hostelInfoButton.setTitleColor(Colors.lightGrayRGB, for: .normal)
        } else {
            let posX = hostelInfoButton.frame.origin.x
            academicHorizontalBarLeftAnchorConstraint?.constant = posX
            academicInfoButton.setTitleColor(Colors.lightGrayRGB, for: .normal)
            hostelInfoButton.setTitleColor(Colors.blackRGB, for: .normal)
        }
    }
}



extension ViewController: UITextFieldDelegate {
    
    //MARK:- Text Field delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        guard let window = UIApplication.shared.windows.first else { return }
        let rectInScrollView = textField.convert(textField.frame, to: self.view)
//        let textFieldRectInView = textField.convert(rectInScrollView, to: self.view)
        let yOrigin = rectInScrollView.origin.y + rectInScrollView.size.height
        self.yOriginOfCurrentlySelectedTextField = yOrigin
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 101 {
            fatherDetails["name"] = textField.text
        } else if textField.tag == 102 {
            fatherDetails["occupation"] = textField.text
        } else if textField.tag == 103 {
            fatherDetails["email"] = textField.text
        } else if textField.tag == 104 {
            fatherDetails["countryCode"] = textField.text
        } else if textField.tag == 105 {
            fatherDetails["phone"] = textField.text
        } else if textField.tag == 106 {
            fatherDetails["address"] = textField.text
        } else if textField.tag == 107 {
            fatherDetails["city"] = textField.text
        } else if textField.tag == 108 {
            fatherDetails["pin"] = textField.text
        }
            
        else if textField.tag == 109 {
            motherDetails["name"] = textField.text
        } else if textField.tag == 110 {
            motherDetails["occupation"] = textField.text
        } else if textField.tag == 111 {
            motherDetails["email"] = textField.text
        } else if textField.tag == 112 {
            motherDetails["countryCode"] = textField.text
        } else if textField.tag == 113 {
            motherDetails["phone"] = textField.text
        } else if textField.tag == 114 {
            motherDetails["address"] = textField.text
        } else if textField.tag == 115 {
            motherDetails["city"] = textField.text
        } else if textField.tag == 116 {
            motherDetails["pin"] = textField.text
        }
            
        else if textField.tag == 117 {
            guardianDetails["name"] = textField.text
        } else if textField.tag == 118 {
            guardianDetails["occupation"] = textField.text
        } else if textField.tag == 119 {
            guardianDetails["email"] = textField.text
        } else if textField.tag == 120 {
            guardianDetails["countryCode"] = textField.text
        } else if textField.tag == 121 {
            guardianDetails["phone"] = textField.text
        } else if textField.tag == 122 {
            guardianDetails["address"] = textField.text
        } else if textField.tag == 123 {
            guardianDetails["city"] = textField.text
        } else if textField.tag == 124 {
            guardianDetails["pin"] = textField.text
        }
            
            
        else if textField.tag == 125 {
            academicDetails["registrationId"] = textField.text
        } else if textField.tag == 126 {
            academicDetails["course"] = textField.text
        } else if textField.tag == 127 {
            academicDetails["stream"] = textField.text
        } else if textField.tag == 128 {
            academicDetails["joiningYear"] = textField.text
        } else if textField.tag == 129 {
            academicDetails["currentYear"] = textField.text
        }
            
            
        else if textField.tag == 130 {
            hostelDetails["hostel"] = textField.text
        } else if textField.tag == 131 {
            hostelDetails["block"] = textField.text
        } else if textField.tag == 132 {
            hostelDetails["room"] = textField.text
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //        if textField.tag == 1005 {
        //            guard let text = textField.text else { return true }
        //            let newLength = text.count + string.count - range.length
        //            return newLength <= 50 // Bool
        //        }else if textField.tag == 1006 {
        //            guard let text = textField.text else { return true }
        //            let newLength = text.count + string.count - range.length
        //            return newLength <= 10 // Bool
        //        }
        //        else{
        //            return true
        //        }
        return true
    }
}



extension UITextField {
    func setTextFiledProperties(placeHolder:String) {
        self.attributedPlaceholder = NSAttributedString(string: placeHolder,
         attributes: [NSAttributedString.Key.foregroundColor: Colors.lightGrayRGB])
        self.textColor = Colors.blackRGB
        self.font = UIFont.sfDisplayRegular(ofSize: 16)
        self.textAlignment = .left
    }
}
