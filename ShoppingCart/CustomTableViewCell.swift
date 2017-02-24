//
//  CustomTableViewCell.swift
//  ShoppingCart
//
//  Created by Alessandro Musto on 2/21/17.
//  Copyright © 2017 Lmusto. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  var pan: UIPanGestureRecognizer!
  var deleteLabel1: UILabel!
  var deleteLabel2: UILabel!
  var cellIndex: IndexPath!
  var tableView: UITableView!

    override func awakeFromNib() {
        super.awakeFromNib()
      commonInit()
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  private func commonInit() {
//    self.backgroundColor = UIColor.red
    self.textLabel?.textColor = UIColor.white

    self.contentView.backgroundColor = UIColor.gray


    let view = UIView()
    view.frame = self.frame
    view.backgroundColor = UIColor.red
    self.insertSubview(view, belowSubview: self.contentView)



    deleteLabel1 = UILabel()
    deleteLabel1.text = "delete"
    deleteLabel1.textColor = UIColor.white
    self.insertSubview(deleteLabel1, belowSubview: self.contentView)

    deleteLabel2 = UILabel()
    deleteLabel2.text = "delete"
    deleteLabel2.textColor = UIColor.white
    self.insertSubview(deleteLabel2, belowSubview: self.contentView)


    pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
    pan.delegate = self

    self.addGestureRecognizer(pan)
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if (pan.state == UIGestureRecognizerState.changed) {
      let p: CGPoint = pan.translation(in: self)
      let width = self.contentView.frame.width
      let height = self.contentView.frame.height
      self.contentView.frame = CGRect(x: p.x,y: 0, width: width, height: height);
      self.deleteLabel1.frame = CGRect(x: p.x - deleteLabel1.frame.size.width-10, y: 0, width: 100, height: height)
      self.deleteLabel2.frame = CGRect(x: p.x + width + deleteLabel2.frame.size.width, y: 0, width: 100, height: height)
    }

  }

  override func prepareForReuse() {
    self.contentView.frame = self.bounds
  }


  func onPan(_ pan: UIPanGestureRecognizer) {
    if pan.state == UIGestureRecognizerState.began {

    } else if pan.state == UIGestureRecognizerState.changed {
      self.setNeedsLayout()
    } else {
      if abs(pan.velocity(in: self).x) > 500 {
        tableView.delegate?.tableView!(tableView, performAction: #selector(onPan(_:)), forRowAt: cellIndex, withSender: nil)
      } else {
        UIView.animate(withDuration: 0.2, animations: {
          self.setNeedsLayout()
          self.layoutIfNeeded()
        })
      }
    }
  }

  override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }

  override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return abs((pan.velocity(in: pan.view)).x) > abs((pan.velocity(in: pan.view)).y)
  }
}


