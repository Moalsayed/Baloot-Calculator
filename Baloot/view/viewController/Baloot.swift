//
//  Baloot.swift
//  Baloot
//
//  Created by Mohammed Alsayed on 26/05/1443 AH.
//

import UIKit
import CoreData

class Baloot: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var entersView: UIStackView!
    @IBOutlet weak var enterLnA: UITextField!
    @IBOutlet weak var enterLhM: UITextField!
    @IBOutlet weak var newSakaBtn: UIButton!
    @IBOutlet weak var undoBtn: UIButton!
    
    
    @IBOutlet weak var calBtn: UIButton!
    
    @IBOutlet weak var lnaTop: UILabel!
    @IBOutlet weak var lhmTop: UILabel!
    
   
    @IBOutlet weak var viewTable: UIView!
    
    
    
    let calculator = BalootCalculator.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        updateUI()
        
        viewTable.layer.cornerRadius = 20
        overrideUserInterfaceStyle = .light
        // to disable the darkmode
        
       
        let defult = UserDefaults.standard
        defult.set(BalootCalculator.result.count, forKey: "MM")
        
//        resultView.layer.cornerRadius = 30
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    @IBAction func ClkBtnCul(_ sender: Any) {
        if((enterLnA.text == nil || enterLnA.text == "") && (enterLhM.text == nil || enterLhM.text == "")) {
            view.endEditing(true)
            return;
        }
        let lahmScore = enterLhM.text == nil || enterLhM.text == "" ? 0 : Int((enterLhM.text! as NSString).intValue)
        let lanaScore = enterLnA.text == nil || enterLnA.text == "" ? 0 : Int((enterLnA.text! as NSString).intValue)
        
        
        BalootCalculator.add(lana:lanaScore, lahm:lahmScore)
        enterLhM.text = ""
        enterLnA.text = ""
        
        self.updateUI()
        self.checkWinner()
        
        
    }
    
    
    func updateUI() {
        if (BalootCalculator.currentScore.lahm == 0){
            lhmTop.text = "0"
        } else {
            lhmTop.text = "\(BalootCalculator.currentScore.lahm)"
        }
        
        if (BalootCalculator.currentScore.lana == 0){
            lnaTop.text = "0"
        } else {
            lnaTop.text = "\(BalootCalculator.currentScore.lana)"
        }
        tableView.reloadData()
        if(BalootCalculator.result.count > 0){
            let indexPath = IndexPath(row: BalootCalculator.result.count - 1, section: 0)
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
        
        
        //        var score = BalootCalculator.total()
        //        totalLna.text = String(score.lana)
        //        totalLhm.text = String(score.lahm)
    }
    @IBAction func newSaka(_ sender: Any) {
        
        let alert = MyAlertViewController(
            title: " بداية صكة جديدة؟",
            message: nil,
            imageName: "warning_icon")

        alert.addAction(title: "نعم", style: .default) { (action) in
            
            BalootCalculator.result.removeAll()
            self.updateUI()
        }
        alert.addAction(title: "إلغاء", style: .cancel)

        present(alert, animated: true, completion: nil)
        
       
        
        
//        let alert = UIAlertController(title: "هل أنت متأكد من بداية صكة جديدة؟", message: nil, preferredStyle: .alert)
//        let yesAction = UIAlertAction(title: "نعم", style: .cancel) { (action) in BalootCalculator.result.removeAll()
//            self.updateUI()
//        }
//        let cancelAction = UIAlertAction(title: "إلغاء", style: .default, handler: nil)
//        alert.addAction(yesAction)
//        alert.addAction(cancelAction)
//        present(alert, animated: true, completion: nil);
    }
    func checkWinner() {
        let lanaScore = BalootCalculator.currentScore.lana
        let lahmScore = BalootCalculator.currentScore.lahm
        
        if(lanaScore < 152 && lahmScore < 152) || (lanaScore == 152 && lahmScore == 152) {
            return
        }
        
        if(lanaScore >= 152 && lanaScore > lahmScore){
            let alert = MyAlertViewController(
                title: nil,
                message: "  بدء صكة جديدة؟",
                imageName: "Image")

            alert.addAction(title: "نعم", style: .default) { (action) in
                
                BalootCalculator.result.removeAll()
                self.updateUI()
            }
            alert.addAction(title: "لا", style: .cancel)

            present(alert, animated: true, completion: nil)
            
            
            
            
//            let alert = UIAlertController(title: "🏆", message: " هل تريد بدء صكة جديدة؟", preferredStyle: .alert)
//            let newSakaAction = UIAlertAction(title: "نعم", style: .cancel, handler: { (action) in BalootCalculator.result.removeAll()
//
//                self.updateUI()
//            })
//
//            let noAction = UIAlertAction(title: "لا", style: .default, handler: nil)
//
//            alert.addAction(newSakaAction)
//            alert.addAction(noAction)
//
//            present(alert, animated: true, completion: nil)
        }
        
        if(lahmScore >= 152 && lahmScore > lanaScore) {
            
            let alert = MyAlertViewController(
                title: nil,
                message: "  بدء صكة جديدة؟",
                imageName: "Image")

            alert.addAction(title: "نعم", style: .default) { (action) in
                
                BalootCalculator.result.removeAll()
                self.updateUI()
            }
            alert.addAction(title: "لا", style: .cancel)

            present(alert, animated: true, completion: nil)
            
            
            
            
//            let alert = UIAlertController(title: "🏆", message: "هل تريد بدء صكة جديدة؟", preferredStyle: .alert)
//            let newSakaAction = UIAlertAction(title: "نعم", style: .cancel, handler: { (action) in
//                BalootCalculator.result.removeAll()
//                self.updateUI()
//            })
//            let noAction = UIAlertAction(title: "لا", style: .default, handler: nil)
//
//            alert.addAction(newSakaAction)
//            alert.addAction(noAction)
//            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func undo(_ sender: Any) {
        
        let alert = MyAlertViewController(
            title: "تراجع",
            message: nil,
            imageName: "warning_icon")

      
        alert.addAction(title: "نعم", style: .default) { (action) in BalootCalculator.result.removeLast()
            self.calculator.undo()
            self.updateUI()
        }
        alert.addAction(title: "عودة", style: .cancel)

        present(alert, animated: true, completion: nil)
        
       
        
        
        
//        let alert = UIAlertController(title: "رجوع", message: nil, preferredStyle: .alert)
//
//
//        let yesAction = UIAlertAction(title: "نعم", style: .cancel) { (action) in BalootCalculator.result.removeLast()
//            self.calculator.undo()
//            self.updateUI()
//
//        }
//
//            let cancelAction = UIAlertAction(title: "إلغاء", style: .default, handler: nil)
//            alert.addAction(yesAction)
//            alert.addAction(cancelAction)
//            present(alert, animated: true, completion: nil);
//
//
  }
        
   
}


extension Baloot: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BalootCalculator.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let score = BalootCalculator.result[indexPath.row]
        
        if(score.type == .score){
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "ScoreCell") as! ScoreCell
            cell.configure(score: score)
            
            
            return cell
            
        } else if(score.type == .result) {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultCell
            cell.configure(score: score)
            return cell
        }
        
        return UITableViewCell()
        
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundView?.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(BalootCalculator.result[indexPath.row].type == .score) {
            return 45
        } else if (BalootCalculator.result[indexPath.row].type == .result && BalootCalculator.result.count - 1 == indexPath.row) {
            return 45
        } else {
            return 45
        }
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       get {
          return .portrait  //to make it portrait not moving sides
       }
    }
    
}






