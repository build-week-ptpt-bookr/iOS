//
//  SettingsViewController.swift
//  Bookr
//
//  Created by Aaron on 8/21/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settings: [SettingsModel] = [ SettingsModel(title: "Dark Mode", color: .light)]
    
    @IBOutlet weak var usernameLabel: UILabel!
    

    var delegate: LoginDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func switchButtonTapped(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = .black
            settings.remove(at: 0)
            let darkMode = SettingsModel(title: "Dark Mode", color: .dark)
            settings.append(darkMode)
            
        } else if !sender.isOn {
            view.backgroundColor = .white
            let lightMode = SettingsModel(title: "Dark Mode", color: .light)
            settings.append(lightMode)
        }
        
    }
    
    

}

extension SettingsViewController: UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as? SettingsTableViewCell else { return UITableViewCell()}
        
        let setting = settings[indexPath.row]
        cell.setting = setting
        return cell
    }
    
   
}

extension SettingsViewController: LoginDelegate {
    func userAttemptedToLogIn(_ creds: [String : String]) {
//        let user = creds[""]
    }
    
    
    
    
}
