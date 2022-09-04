//
//  RootViewController.swift
//  Weather
//
//  Created by onakama on 2022/09/04.
//

import UIKit

final class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "weatherView") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.presentationController?.delegate = self
        self.present(vc, animated: true, completion: nil)
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
extension RootViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "weatherView") as! ViewController
        vc.presentationController?.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
}

