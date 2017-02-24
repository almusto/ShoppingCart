//
//  InputView.swift
//  ShoppingCart
//
//  Created by Alessandro Musto on 2/21/17.
//  Copyright © 2017 Lmusto. All rights reserved.
//

import UIKit


class InputView: UIViewController, UITextViewDelegate, UIScrollViewDelegate {

  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var button: UIButton!

  var scrollView: UIScrollView = UIScrollView()


  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false

    view.addSubview(scrollView)
    scrollView.frame = self.view.bounds
    scrollView.delegate = self
    scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
    scrollView.addSubview(textView)

    textView.delegate = self
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.topAnchor.constraint(equalTo: scrollView.topAnchor)
    textView.widthAnchor.constraint(equalToConstant: scrollView.bounds.width)
    textView.heightAnchor.constraint(equalToConstant: 400)


    scrollView.addSubview(button)

    button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
    button.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -200)


    scrollView.backgroundColor = UIColor.white


//
//    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UITextViewTextDidEndEditing, object: nil)

  }

//  func keyboardWillShow(notification: NSNotification) {
//
//    if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//      if view.frame.origin.y == 0{
//        view.frame.origin.y -= keyboardSize.height
//      }
//    }
//
//  }
//
//  func keyboardWillHide(notification: NSNotification) {
//    if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//      if view.frame.origin.y != 0{
//        view.frame.origin.y += keyboardSize.height
//      }
//    }
//  }
//
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if(text == "\n") {
      textView.resignFirstResponder()
      return false
    }
    return true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "createCart" {
      if textView.text != nil {
        let dest = segue.destination as! ShoppingCartTableViewController
        dest.shoppingCart = textView.text.components(separatedBy: "\n")
    }
  }
}




}

