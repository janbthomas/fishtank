//
//  ViewController.swift
//  FishTank_JanThomas_NadiraMamotova
//
//  Created by Jan on 2/8/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numFish: UISlider!


    var fishList = [
        FishObject(iImageView: nil, aDly: 1.0, aDur: 5.0, iImage: #imageLiteral(resourceName: "fish1")),
        FishObject(iImageView: nil, aDly: 5.0, aDur: 8.0, iImage: #imageLiteral(resourceName: "fish2")),
        FishObject(iImageView: nil, aDly: 8.0, aDur: 10.0, iImage: #imageLiteral(resourceName: "fish3")),
        FishObject(iImageView: nil, aDly: 11.0, aDur: 9.0, iImage: #imageLiteral(resourceName: "fish4")),
        FishObject(iImageView: nil, aDly: 15.0, aDur: 12.0, iImage: #imageLiteral(resourceName: "fish5")),
        FishObject(iImageView: nil, aDly: 18.0, aDur: 4.0, iImage: #imageLiteral(resourceName: "fish6")),
        FishObject(iImageView: nil, aDly: 20.0, aDur: 3.0, iImage: #imageLiteral(resourceName: "fish7")),
        FishObject(iImageView: nil, aDly: 22.0, aDur: 11.0, iImage: #imageLiteral(resourceName: "fish8")),
        FishObject(iImageView: nil, aDly: 13.0, aDur: 13.0, iImage: #imageLiteral(resourceName: "fish9"))
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = #imageLiteral(resourceName: "background")
        self.view.insertSubview(backgroundImage, at: 0)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill;
    }
    
    @IBAction func animateFish(_ sender: Any) {
        
        // Delete any fish that are already swimming in the fishtank
        for iFish in 0...self.fishList.count-1 {
            if (self.fishList[iFish].iImageView != nil) {
                self.fishList[iFish].iImageView!.removeFromSuperview()
            }
        }
        
        let numberOfFish = Int(roundf(self.numFish!.value))
        let screenWidth = Int(UIScreen.main.bounds.width)
        
        
        //print( "numberOfFish \(numberOfFish) \(self.numFish)")
        //print( "screenSize: \(screenWidth)")
        
        // Start a loop to show and animate cars one by one
        for iFish in 0...numberOfFish-1 {
        
            //Define the dimensions of the fish using randomization
            let wFish = 75
            let hFish = (wFish * 3)/4
            let xStart = 0 - wFish
            let xEnd = screenWidth - wFish
            let yPos = Int(arc4random() % 350) + 50
            
            // Define the duration and delay of the animation
            let aDur = self.fishList[iFish].aDur
            let aDly = self.fishList[iFish].aDly
            
            // Now set our car image
            let fish = UIImageView()
            
            self.fishList[iFish].iImageView = fish
            
            fish.image = self.fishList[iFish].iImage
            fish.frame = CGRect(x: xStart, y: yPos, width: wFish, height: hFish)
            self.view.addSubview(fish)
            
            let aFrame = CGRect(x: xEnd, y: yPos + 30, width: wFish, height: hFish)
            let bFrame = CGRect(x: 0, y: yPos, width: wFish, height: hFish)
            
            //print( "Fish: \(iFish) Duration \(aDur) Delay \(aDly) y \(yPos)")
            animateRight( aDur: aDur, aDly: aDly, aFrame: aFrame, bFrame: bFrame, fish: fish)
            

        }
    }
    
    func animateRight( aDur: Double, aDly: Double, aFrame: CGRect, bFrame: CGRect, fish: UIImageView) {
        if (aDly == 0) {
            //UIView.animate( withDuration: 1, animations: { fish.alpha=0})
            UIView.animate( withDuration: 0, animations: { fish.transform = CGAffineTransform(scaleX: 1, y: 1)})
            //UIView.animate( withDuration: 1, animations: { fish.alpha=1})
            
            print("Animate flip image")
        }
        // Now animate the car and then remove it once it goes post right edge
        UIView.animate(withDuration: aDur, delay: aDly, options: [UIViewAnimationOptions.curveLinear], animations: {
            fish.frame = aFrame}, completion: {(finished:Bool) in
                self.animateLeft( aDur: aDur, aDly: 0, aFrame: aFrame, bFrame: bFrame, fish: fish) }
        )

        
    }
    
    func animateLeft( aDur: Double, aDly: Double, aFrame: CGRect, bFrame: CGRect, fish: UIImageView) {

        UIView.animate( withDuration: 0, animations: { fish.transform = CGAffineTransform(scaleX: -1, y: 1)})
       
        // Now animate the car and then remove it once it goes post right edge
        UIView.animate(withDuration: aDur, delay: aDly, options: [UIViewAnimationOptions.curveLinear], animations: {
            fish.frame = bFrame}, completion: {(finished:Bool) in
                self.animateRight( aDur: aDur, aDly: 0, aFrame: aFrame, bFrame: bFrame, fish: fish) }
        )
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

