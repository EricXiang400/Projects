//
//  EditMyPage.swift
//  MayApp1
//
//  Created by Calvin Du on 7/5/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit
import FirebaseDatabase
import FirebaseAuth


class EditMyPage: UIViewController, UITextViewDelegate {
    var database = Database.database().reference()
    let storage = Storage.storage().reference()
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!
   
    @IBOutlet weak var ProfDescriptionTextView: UITextView!
    @IBOutlet var charsLeftLabel: UILabel!
    
    
     override func viewDidLoad() {
          super.viewDidLoad()

          ProfDescriptionTextView.smartInsertDeleteType = UITextSmartInsertDeleteType.no
          ProfDescriptionTextView.delegate = self
        toolsTextView.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        toolsTextView.delegate = self
      }
//words limits
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
          guard let rangeOfTextToReplace = Range(range, in: textView.text) else {
              return false
          }
          let substringToReplace = textView.text[rangeOfTextToReplace]
          let count = textView.text.count - substringToReplace.count + text.count
        charsLeftLabel.text = "\(140 - count)"
           return count <= 140
            
    // toolCharsLeftLabel.text = "\(100 - count)"
    // return count <= 100
      }

    
    
    @IBOutlet weak var skillsTagsTextView: UITextView!
    @IBOutlet weak var addTagsButton: UIButton!
    @IBOutlet weak var minusTagsButton: UIButton!
    
    @IBOutlet weak var jobTypeTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var unitTextField: UITextField!
    @IBOutlet weak var addPriceButton: UIButton!
    @IBOutlet weak var minusPriceButton: UIButton!
    
    @IBOutlet weak var milesTextField: UITextField!
    
    //upload images outlet, do this later
    
    @IBOutlet weak var toolsTextView: UITextView!
    @IBOutlet weak var toolCharsLeftLabel: UILabel!
   
    
    
    
    
    
    
    
    //schedule setting,
    var isActive:Bool = false
    //change button check to cancel
    @IBOutlet weak var mondayButton: UIButton!
    @IBAction func mButtonTapped(_ sender: Any) {
        if isActive {
            isActive = false
           
            mondayButton.setImage(UIImage(named: "Checked.png"), for: .normal)
        }
        else {
            isActive = true
            mondayButton.setImage(UIImage(named: "Cancel.png"), for: .normal)
        }
    }
    @IBOutlet weak var mFirstBeginTime: UITextField!
    @IBOutlet weak var mFirstEndTime: UITextField!
    @IBOutlet weak var mSecondBeginTime: UITextField!
    @IBOutlet weak var mSecondEndTime: UITextField!
    
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBAction func tButtonTapped(_ sender: Any) {
        if isActive {
            isActive = false
           
            tuesdayButton.setImage(UIImage(named: "Checked.png"), for: .normal)
        }
        else {
            isActive = true
            tuesdayButton.setImage(UIImage(named: "Cancel.png"), for: .normal)
        }
    }
    @IBOutlet weak var tFirstBeginTime: UITextField!
    @IBOutlet weak var tFirstEndTime: UITextField!
    @IBOutlet weak var tSecondBeginTime: UITextField!
    @IBOutlet weak var tSecondEndTime: UITextField!
    
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBAction func wButtonTapped(_ sender: Any) {
        if isActive {
            isActive = false
           
            wednesdayButton.setImage(UIImage(named: "Checked.png"), for: .normal)
        }
        else {
            isActive = true
            wednesdayButton.setImage(UIImage(named: "Cancel.png"), for: .normal)
        }
    }
    @IBOutlet weak var wFirstBeginTime: UITextField!
    @IBOutlet weak var wFirstEndTime: UITextField!
    @IBOutlet weak var wSecondBeginTime: UITextField!
    @IBOutlet weak var wSecondEndTime: UITextField!
   
    @IBOutlet weak var thursdayButton: UIButton!
    @IBAction func thButtonTapped(_ sender: Any) {
        if isActive {
            isActive = false
           
            thursdayButton.setImage(UIImage(named: "Checked.png"), for: .normal)
        }
        else {
            isActive = true
            thursdayButton.setImage(UIImage(named: "Cancel.png"), for: .normal)
        }
    }
    @IBOutlet weak var thFirstBeginTime: UITextField!
    @IBOutlet weak var thFirstEndTime: UITextField!
    @IBOutlet weak var thSecondBeginTime: UITextField!
    @IBOutlet weak var thSecondEndTime: UITextField!
    
    @IBOutlet weak var fridayButton: UIButton!
    @IBAction func fButtonTapped(_ sender: Any) {
        if isActive {
            isActive = false
           
            fridayButton.setImage(UIImage(named: "Checked.png"), for: .normal)
        }
        else {
            isActive = true
            fridayButton.setImage(UIImage(named: "Cancel.png"), for: .normal)
        }
    }
    @IBOutlet weak var fFirstBeginTime: UITextField!
    @IBOutlet weak var fFirstEndTime: UITextField!
    @IBOutlet weak var fFecondBeginTime: UITextField!
    @IBOutlet weak var fFecondEndTime: UITextField!
    
    @IBOutlet weak var saturdayButton: UIButton!
    @IBAction func satButtonTapped(_ sender: Any) {
        if isActive {
            isActive = false
           
            saturdayButton.setImage(UIImage(named: "Checked.png"), for: .normal)
        }
        else {
            isActive = true
            saturdayButton.setImage(UIImage(named: "Cancel.png"), for: .normal)
        }
    }
    @IBOutlet weak var satFirstBeginTime: UITextField!
    @IBOutlet weak var satFirstEndTime: UITextField!
    @IBOutlet weak var satSecondBeginTime: UITextField!
    @IBOutlet weak var satSecondEndTime: UITextField!
    
    @IBOutlet weak var sundayButton: UIButton!
    @IBAction func sunButtonTapped(_ sender: Any) {
        if isActive {
            isActive = false
           
            sundayButton.setImage(UIImage(named: "Checked.png"), for: .normal)
        }
        else {
            isActive = true
            sundayButton.setImage(UIImage(named: "Cancel.png"), for: .normal)
        }
    }
    @IBOutlet weak var sunFirstBeginTime: UITextField!
    @IBOutlet weak var sunFirstEndTime: UITextField!
    @IBOutlet weak var sunSecondBeginTime: UITextField!
    @IBOutlet weak var sunSecondEndTime: UITextField!
    
    
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveTapped(_ sender: Any){
        //i just need to change userinfo to unnque uid later
        
        let email = Auth.auth().currentUser!.email
        
        let safeEmail = DataBaseManager.safeEmail(emailAddress: email!)
       
        database.child("userinfo").child(safeEmail).child("name").setValue(nameTextField.text)
        database.child("userinfo").child(safeEmail).child("email").setValue(emailTextField.text)
        database.child("userinfo").child(safeEmail).child("phone").setValue(phoneTextField.text)
        database.child("userinfo").child(safeEmail).child("profession").setValue(professionTextField.text)
        database.child("userinfo").child(safeEmail).child("phone").setValue(phoneTextField.text)
        database.child("userinfo").child(safeEmail).child("Profile_Description").setValue(ProfDescriptionTextView.text)
        database.child("userinfo").child(safeEmail).child("job_type").child("job_type").setValue(jobTypeTextField.text)
        database.child("userinfo").child(safeEmail).child("job_type").child("price").setValue(priceTextField.text)
        database.child("userinfo").child(safeEmail).child("job_type").child("unit").setValue(unitTextField.text)
        database.child("userinfo").child(safeEmail).child("miles").setValue(milesTextField.text)
        database.child("userinfo").child(safeEmail).child("tools").setValue(toolsTextView.text)
        database.child("userinfo").child(safeEmail).child("tags").setValue(skillsTagsTextView.text)
        //storage.child("userinfo").child(safeEmail).putData()
        //database.child images links
        //database.child schedules
        
        
        let alert = UIAlertController(title: "Success", message: "Data added successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: {_ in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}
