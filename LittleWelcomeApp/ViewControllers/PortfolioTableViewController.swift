//
//  PortfolioTableViewController.swift
//  LittleWelcomeApp
//
//  Created by Anton Saltykov on 16.08.2022.
//

import UIKit

final class PortfolioTableViewController: UITableViewController {

    // MARK: - Public Properties
    var portfolio: [Portfolio] = []

    // MARK: - Override Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return portfolio.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PortfolioItem", for: indexPath)

        cell.imageView?.image = UIImage(named: portfolio[indexPath.row].siteImage)
        cell.textLabel?.text = portfolio[indexPath.row].siteName

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let portfolioItemVC = segue.destination as? PortfolioItemViewController else { return }
        if let indexPath = self.tableView.indexPathForSelectedRow {
            portfolioItemVC.portfolioItem = portfolio[indexPath.row]
        }
    }
}
