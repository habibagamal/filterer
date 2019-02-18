//
//  ViewController.swift
//  filterer
//
//  Created by Habiba Bassem on 12/29/18.
//  Copyright © 2018 Habiba Bassem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate{

    //declarations
    var filteredImage: UIImage?
    let image = UIImage(named: "Icon")!
    var newImage: UIImage?
    var editImage: UIImage?
    var tapped = false
    var cam = false
    var compareEnabled = false
    var value = 10.0
    var type = "N/A"
    let scale = 50.0
//    @IBOutlet var overlay: UIView!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    @IBOutlet var HSlider: UISlider!
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var zoomTapGestureRecognizer: UITapGestureRecognizer!
    
    @IBOutlet var slider: UIView!
    
    @IBOutlet var red: UIButton!
    @IBOutlet var green: UIButton!
    @IBOutlet var blue: UIButton!
    @IBOutlet var bw: UIButton!
    @IBOutlet var xbw: UIButton!
    @IBOutlet var edit: UIButton!
    @IBOutlet var filterButton: UIButton!
    @IBOutlet var compare: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var bottomMenu: UIView!
    
    @IBOutlet var waiting: UIActivityIndicatorView!
    
    
    //When slider is moved
    @IBAction func onSlider(_ sender: UISlider) {
        value = Double(sender.value)
        print (value * scale)
        var myRGBA = RGBAImage(image:editImage ?? image)!
        self.filter (type: type, level: value * scale, myRGBA: &myRGBA)
        newImage = myRGBA.toUIImage()
        if (cam){
            newImage = UIImage(cgImage: newImage?.cgImage! ?? image as! CGImage, scale: newImage!.scale, orientation: .right)
        }
        UIView.transition(with: self.imageView,
                          duration:0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.imageView.image = self.newImage },
                          completion: nil)
        compareEnabled = true
        edit.isEnabled = true
        sender.isSelected = true
        waiting.alpha = 0.0
    }
    
    //when red filter is pressed
    @IBAction func onRed(_ sender: UIButton) {
        if (!sender.isSelected){
            var myRGBA = RGBAImage(image:editImage ?? image)!
            type = "Red"
            value = 10
            HSlider.setValue(Float(value/scale), animated: false)
            self.filter (type: type, level: value, myRGBA: &myRGBA)
            newImage = myRGBA.toUIImage()
            if (cam){
                newImage = UIImage(cgImage: newImage?.cgImage! ?? image as! CGImage, scale: newImage!.scale, orientation: .right)
            }
            UIView.transition(with: self.imageView,
                              duration:0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.imageView.image = self.newImage },
                              completion: nil)
            compareEnabled = true
            edit.isEnabled = true
            sender.isSelected = true
            waiting.alpha = 0.0
        }
    }
    
    //when green filter is pressed
    @IBAction func onGreen(_ sender: UIButton) {
        if (!sender.isSelected){
            var myRGBA = RGBAImage(image:editImage ?? image)!
            //            var myRGBAKeep = RGBAImage(image:editImage ?? image)!
            type = "Green"
            value = 10
            HSlider.setValue(Float(value/scale), animated: false)
            self.filter (type: type, level: value, myRGBA: &myRGBA)
            newImage = myRGBA.toUIImage()
            if (cam){
                newImage = UIImage(cgImage: newImage?.cgImage! ?? image as! CGImage, scale: newImage!.scale, orientation: .right)
            }
            UIView.transition(with: self.imageView,
                              duration:0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.imageView.image = self.newImage },
                              completion: nil)
            compareEnabled = true
            edit.isEnabled = true
            sender.isSelected = true
        }
    }
    
    //when blue filter is pressed
    @IBAction func onBlue(_ sender: UIButton) {
        if (!sender.isSelected){
            var myRGBA = RGBAImage(image:editImage ?? image)!
            //            var myRGBAKeep = RGBAImage(image:editImage ?? image)!
            type = "Blue"
            value = 10
            HSlider.setValue(Float(value/scale), animated: false)
            self.filter (type: type, level: value, myRGBA: &myRGBA)
            newImage = myRGBA.toUIImage()
            if (cam){
                newImage = UIImage(cgImage: newImage?.cgImage! ?? image as! CGImage, scale: newImage!.scale, orientation: .right)
            }
            UIView.transition(with: self.imageView,
                              duration:0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.imageView.image = self.newImage },
                              completion: nil)
            compareEnabled = true
            edit.isEnabled = true
            sender.isSelected = true
        }
    }
    
    //when B&W filter is pressed
    @IBAction func onBW(_ sender: UIButton) {
        if (!sender.isSelected){
            var myRGBA = RGBAImage(image:editImage ?? image)!
            //            var myRGBAKeep = RGBAImage(image:editImage ?? image)!
            type = "BW"
            value = 10
            HSlider.setValue(Float(value/scale), animated: false)
            self.filter (type: type, level: value, myRGBA: &myRGBA)
            newImage = myRGBA.toUIImage()
            if (cam){
                newImage = UIImage(cgImage: newImage?.cgImage! ?? image as! CGImage, scale: newImage!.scale, orientation: .right)
            }
            UIView.transition(with: self.imageView,
                              duration:0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.imageView.image = self.newImage },
                              completion: nil)
            compareEnabled = true
            edit.isEnabled = true
            sender.isSelected = true
        }
    }
    
    //when Xtreme B&W filter is pressed
    @IBAction func onXBW(_ sender: UIButton) {
        if (!sender.isSelected){
            var myRGBA = RGBAImage(image:editImage ?? image)!
            //            var myRGBAKeep = RGBAImage(image:editImage ?? image)!
            type = "XtremeBW"
            value = 10
            HSlider.setValue(Float(value/scale), animated: false)
            self.filter (type: type, level: value, myRGBA: &myRGBA)
            newImage = myRGBA.toUIImage()
            if (cam){
                newImage = UIImage(cgImage: newImage?.cgImage! ?? image as! CGImage, scale: newImage!.scale, orientation: .right)
            }
            UIView.transition(with: self.imageView,
                              duration:0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.imageView.image = self.newImage },
                              completion: nil)
            compareEnabled = true
            edit.isEnabled = true
            sender.isSelected = true
        }
    }
    
    //When share button is pressed
    @IBAction func onShare(_ sender: UIButton) {
        let activityController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    //When new photo is pressed
    @IBAction func onNewPhoto(_ sender: AnyObject) {
        let actionSheet = UIAlertController(title:"New Photo", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
            action in
            self.showCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Album", style: .default, handler: {
        action in
            self.showAlbum()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    //Opens camera
    func showCamera(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        self.cam = true
        present(cameraPicker, animated: true, completion: nil)
    }
    
    //Opens library
    func showAlbum(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .photoLibrary
        self.cam = false
        present(cameraPicker, animated: true, completion: nil)
    }
    
    //New image picked. Resets filters
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            editImage = image
            compareEnabled = false
            filterButton.isSelected = false
            red.isSelected = false
            blue.isSelected = false
            green.isSelected = false
            bw.isSelected = false
            xbw.isSelected = false
            edit.isEnabled = false
            hideSecondaryMenu()
            hideSlider()
        }
    }
    
    //New image selection is cancelled
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        self.cam = false
    }
    
    //Edit button is pressed
    @IBAction func onEdit(_ sender: UIButton) {
            if (sender.isSelected){
                hideSlider()
                sender.isSelected = false
            }
            else{
                viewSlider()
                sender.isSelected = true
            }
    }
    
    //Shows the slider
    func viewSlider(){
        view.addSubview(slider)
        hideSecondaryMenu()
        let bottomConstraint = slider.bottomAnchor.constraint(equalTo: bottomMenu.topAnchor)
        let rightConstraint = slider.rightAnchor.constraint(equalTo: view.rightAnchor)
        let leftConstraint = slider.leftAnchor.constraint(equalTo: view.leftAnchor)
        let heightConstraint = slider.heightAnchor.constraint(equalToConstant: 44)
        
        NSLayoutConstraint.activate([bottomConstraint, rightConstraint, leftConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.slider.alpha = 0
        UIView.animate(withDuration: 0.4){
            self.slider.alpha = 1.0
        }
    }
    
    //Hides the slider
    func hideSlider(){
        edit.isSelected = false
        UIView.animate(withDuration: 0.4, animations: {self.slider.alpha = 0.0}, completion: {completed in
            if (completed == true)
            {self.slider.removeFromSuperview()}})
    }
    
    @IBAction func onFilter(_ sender: UIButton) {
        if (sender.isSelected){
            hideSecondaryMenu()
            sender.isSelected = false
        }
        else{
            viewSecondaryMenu()
            sender.isSelected = true
        }
    }
    
    //Hides the filters
    func hideSecondaryMenu(){
        filterButton.isSelected = false
        UIView.animate(withDuration: 0.4, animations: {self.secondaryMenu.alpha = 0.0}, completion: {completed in
            if (completed == true)
                {self.secondaryMenu.removeFromSuperview()}})
    }
    
    //Shows the filters
    func viewSecondaryMenu(){
        view.addSubview(secondaryMenu)
        hideSlider()
        let bottomConstraint = secondaryMenu.bottomAnchor.constraint(equalTo: bottomMenu.topAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraint(equalTo: view.rightAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraint(equalTo: view.leftAnchor)
        let heightConstraint = secondaryMenu.heightAnchor.constraint(equalToConstant: 44)
        
        NSLayoutConstraint.activate([bottomConstraint, rightConstraint, leftConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.secondaryMenu.alpha = 0
        UIView.animate(withDuration: 0.4){
            self.secondaryMenu.alpha = 1.0
        }
    }
    
    ////////////////////////////////////////////////
    //FILTERS
    
    func makeBlue (myRGBA: inout RGBAImage, level: Double, avgBlue: Int){
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let blueDiff = Int(pixel.blue) - avgBlue
                if (blueDiff > 0)
                {
                    pixel.blue = UInt8(max(0, min(255, Double(avgBlue) + Double(blueDiff) * level)))
                    myRGBA.pixels[index] = pixel
                }
            }
        }
    }


    func makeRed (myRGBA: inout RGBAImage, level: Double, avgRed: Int){
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let redDiff = Int(pixel.red) - avgRed
                if (redDiff>0)
                {
                    pixel.red = UInt8(max(0, min(255, Double(avgRed) + Double(redDiff) * level)))
                    myRGBA.pixels[index] = pixel
                }
            }
        }
    }

    func makeGreen (myRGBA: inout RGBAImage, level: Double, avgGreen: Int){
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let greenDiff = Int(pixel.green) - avgGreen
                if (greenDiff>0)
                {
                    pixel.green = UInt8(max(0, min(255, Double(avgGreen) + Double(greenDiff) * level)))
                    myRGBA.pixels[index] = pixel
                }
            }
        }
    }


    func makeBW (myRGBA: inout RGBAImage, level: Double, avgColor: Int, avgGreen: Int, avgBlue: Int, avgRed: Int){
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let avg  = ( Int(pixel.green) + Int(pixel.red) + Int(pixel.blue) ) / 3
                let diff = avg - avgColor
                if (diff>0)
                {
                    pixel.green = UInt8(max(0, min(255, Double(avgGreen) + Double(diff) * level)))
                    pixel.blue = UInt8(max(0, min(255, Double(avgBlue) + Double(diff) * level)))
                    pixel.red = UInt8(max(0, min(255, Double(avgRed) + Double(diff) * level)))
                    myRGBA.pixels[index] = pixel
                }
                else
                {
                    pixel.green = UInt8(max(0, min(255, Double(avgGreen) + Double(diff) / level)))
                    pixel.blue = UInt8(max(0, min(255, Double(avgBlue) + Double(diff) / level)))
                    pixel.red = UInt8(max(0, min(255, Double(avgRed) + Double(diff) / level)))
                    myRGBA.pixels[index] = pixel
                }
            }
        }
    }

    func makeXtremeBW (myRGBA: inout RGBAImage, level:Int, avgColor: Int){
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let avg  = ( Int(pixel.green) + Int(pixel.red) + Int(pixel.blue) ) / 3
                let diff = avg - avgColor
                if ((diff + level)>0)
                {
                    pixel.green = 255
                    pixel.blue = 255
                    pixel.red = 255
                    myRGBA.pixels[index] = pixel
                }
                else
                {
                    pixel.green = 0
                    pixel.blue = 0
                    pixel.red = 0
                    myRGBA.pixels[index] = pixel
                }
            }
        }
    }

//    func makeWeird (myRGBA: inout RGBAImage, level: Int){
//        for y in 0..<myRGBA.height{
//            for x in 0..<myRGBA.width{
//                let index = y * myRGBA.width + x
//                var pixel = myRGBA.pixels[index]
//                let avg  = ( Int(pixel.green) + Int(pixel.red) + Int(pixel.blue) ) / 3
//                let diff = avg - avgColor
//                if (diff > 0)
//                {
//                    pixel.green -= UInt8(max(0, min(255, Int(myRGBA.pixels[index].green) - level)))
//                    pixel.blue -= UInt8(max(0, min(255, Int(myRGBA.pixels[index].blue) - level)))
//                    pixel.red -= UInt8(max(0, min(255, Int(myRGBA.pixels[index].red) - level)))
//                    myRGBA.pixels[index] = pixel
//                }
//            }
//        }
//    }
//
//    func makeCatroon (myRGBA: inout RGBAImage, level: Int){
//        for y in 0..<myRGBA.height{
//            for x in 0..<myRGBA.width{
//                let index = y * myRGBA.width + x
//                var pixel = myRGBA.pixels[index]
//                let avg  = ( Int(pixel.green) + Int(pixel.red) + Int(pixel.blue) ) / 3
//                let diff = avg - avgColor
//                if (diff > 0)
//                {
//                    pixel.green = UInt8 (max (0, min(255, Int(pixel.green)-level)))
//                    pixel.blue = UInt8 (max (0, min(255, Int(pixel.blue)-level)))
//                    pixel.red = UInt8 (max (0, min(255, Int(pixel.red)-level)))
//                    myRGBA.pixels[index] = pixel
//                }
//                else{
//                    pixel.green = UInt8 (max (0, min(255, Int(pixel.green)+level)))
//                    pixel.blue = UInt8 (max (0, min(255, Int(pixel.blue)+level)))
//                    pixel.red = UInt8 (max (0, min(255, Int(pixel.red)+level)))
//                    myRGBA.pixels[index] = pixel
//                }
//            }
//        }
//    }
    
    func makeDark (myRGBA: inout RGBAImage, level: Int){
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let avg  = ( Int(pixel.green) + Int(pixel.red) + Int(pixel.blue) ) / 3
                //            let diff = avg - avgColor
                if (pixel.red == 255)
                {
                    pixel.green = UInt8 (max (0, min(255, Int(pixel.green)-level)))
                    pixel.blue = UInt8 (max (0, min(255, Int(pixel.blue)-level)))
                    myRGBA.pixels[index] = pixel
                }
                else if (pixel.green == 255){
                    pixel.blue = UInt8 (max (0, min(255, Int(pixel.blue)-level)))
                    pixel.red = UInt8 (max (0, min(255, Int(pixel.red)-level)))
                    myRGBA.pixels[index] = pixel
                }
                else if (pixel.blue == 255){
                    pixel.green = UInt8 (max (0, min(255, Int(pixel.green)-level)))
                    pixel.red = UInt8 (max (0, min(255, Int(pixel.red)-level)))
                    myRGBA.pixels[index] = pixel
                }
                else {
                    pixel.green = UInt8 (max (0, min(255, Int(pixel.green)-level)))
                    pixel.blue = UInt8 (max (0, min(255, Int(pixel.blue)-level)))
                    pixel.red = UInt8 (max (0, min(255, Int(pixel.red)-level)))
                    myRGBA.pixels[index] = pixel
                }
                
            }
        }
    }
    
    
    func filter (type: String, level: Double, myRGBA: inout RGBAImage){
        //     Process the image!
        var totalRed = 0
        var totalGreen = 0
        var totalBlue = 0
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                totalRed += Int(pixel.red)
                totalGreen += Int(pixel.green)
                totalBlue += Int(pixel.blue)
            }
        }
        
        let count = myRGBA.width * myRGBA.height
        let avgRed = totalRed / count
        let avgGreen = totalGreen / count
        let avgBlue = totalBlue / count
        let avgColor = (avgRed + avgGreen + avgBlue) / 3
        
        switch (type){
//        case "Dark" :makeDark(myRGBA: &myRGBA, level: Int(level))
//        case "Light":makeDark(myRGBA: &myRGBA, level: Int(-level))
        case "BW": makeBW(myRGBA: &myRGBA, level: level, avgColor: avgColor, avgGreen: avgGreen, avgBlue: avgBlue, avgRed: avgRed)
        case "XtremeBW": makeXtremeBW(myRGBA: &myRGBA, level: Int(level), avgColor: avgColor)
//        case "Cartoon": makeCatroon(myRGBA: &myRGBA, level: Int(level))
        case "Blue": makeBlue(myRGBA: &myRGBA, level: level, avgBlue: avgBlue)
        case "Green": makeGreen(myRGBA: &myRGBA, level: level, avgGreen: avgGreen)
        case "Red": makeRed(myRGBA: &myRGBA, level: level, avgRed: avgRed)
//        case "Weird": makeWeird(myRGBA: &myRGBA, level: Int(level))
        default: print ("Unkown filter")
        }
    }
    //End of filters
    ////////////////////////////////////////////
    
    
    
    //To toggle between edited and original image when image view is pressed
    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
        if tapped {
            UIView.transition(with: self.imageView,
                              duration:0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.imageView.image = self.newImage },
                              completion: nil)
            tapped = false
        }else{
            if (compareEnabled){
                UIView.transition(with: self.imageView,
                                  duration:0.5,
                                  options: .transitionCrossDissolve,
                                  animations: { self.imageView.image = self.editImage },
                                  completion: nil)
                tapped = true
            }
        }
    }
    
    
    //Initial Begin
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        secondaryMenu.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        editImage = image
//        self.overlay.removeFromSuperview()
        
        // TAP Gesture
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        edit.isEnabled = false
        
//        zoomTapGestureRecognizer.numberOfTapsRequired = 2
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @IBAction func onZoom(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.scrollView.zoomScale = 1.5 * self.scrollView.zoomScale
        }
    }
    
}
