
//  PresentView.swift
//  ChudoProject
//
//  Created by SIMONOV on 15.05.2022.
//

import UIKit
import AutoLayoutSugar

class PresentView: UIViewController {
     
    var name: String = ""
    
    private lazy var myImage: UIImageView = {
        let myImageView = UIImageView(frame: view.bounds)
        myImageView.image = UIImage(named: "go")
        myImageView.contentMode = .scaleAspectFill
        
        return myImageView
    }()
    private lazy var welcome: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "\(name), Take Note And Listen Well."
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .white
        welcomeLabel.shadowColor = .black
        welcomeLabel.font = .systemFont(ofSize: 25)
        view.addSubview(welcomeLabel)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIEdgeInsets(top: 200, left: 20, bottom: 0, right: 20)
        welcomeLabel.pin(excluding: .bottom, insets: image, to: view)

        return welcomeLabel
    }()
    
    private lazy var pray: UITextView = {
        let pray = UITextView(frame: view.bounds)
        pray.contentInset = UIEdgeInsets(top: 350, left: 10, bottom: 20, right: 10)
        pray.text = """
          God is on my side, or rather I should say, I'm on God's side.
          And I have the same power that delivered Jesus from temptation and sin.
          I have the same power that raised Him from the grave.
          I have been promised the victory, and I have claimed that victory.
         """
        pray.font = UIFont(name: "Arial", size: 20)
        pray.backgroundColor = .clear
        pray.textAlignment = .center
        pray.textColor = .white
    
        
        return pray
    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(myImage)
        myImage.addSubview(welcome)
        myImage.addSubview(pray)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

