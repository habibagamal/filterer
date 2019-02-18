//
//  InterfaceController.swift
//  filterWatch Extension
//
//  Created by Habiba Bassem on 1/14/19.
//  Copyright © 2019 Habiba Bassem. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var newPhoto: WKInterfaceButton!
    
    @IBAction func onNewPhoto() {
//        let action1 = WKAlertAction(title: "Camera", style: .default, handler: {
//            action in
//            self.showCamera()
//        }
        
        let action2 = WKAlertAction(title: "Album", style: .default) {
            
        }
        let action3 = WKAlertAction(title: "Cancel", style: .cancel){

        }
        
        presentAlert(withTitle: "Alert Title", message: "message is here", preferredStyle:.actionSheet, actions: [action2,action3])
        
//        let actionSheet =  AlertController(title:"New Photo", message: nil, preferredStyle: .actionSheet)////????//
//
//        actionSheet.addAction(WKAlertAction(title: "Camera", style: .default, handler: {
//            action in
//            self.showCamera()
//        }))
//        actionSheet.addAction(WKAlertAction(title: "Album", style: .default, handler: {
//            action in
//            self.showAlbum()
//        }))
//        actionSheet.addAction(WKAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        self.present(actionSheet, animated: true, completion: nil)
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
