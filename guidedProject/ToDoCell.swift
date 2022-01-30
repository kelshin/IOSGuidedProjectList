//
//  ToDoCell.swift
//  guidedProject
//
//  Created by Kelbin David on 2022-01-28.
//

import UIKit

protocol ToDoCellDelegate:AnyObject {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {

    weak var delagate: ToDoCellDelegate?
    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
}

    @IBAction func isCompleteButtonTapped() {
        delagate?.checkmarkTapped(sender: self)
    }
}
