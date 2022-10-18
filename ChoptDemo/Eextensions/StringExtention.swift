//
//  StringExtention.swift
//  ChoptDemo
//
//  Created by Kishor LD on 16/10/22.
//

import Foundation
extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
    }
    func isValidPassword() -> Bool {
        let passwordRegx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        return applyPredicateOnRegex(regexStr: passwordRegx)
    }
    func isValidDOB() -> Bool {
        let dobRegx = "^[0-9]{4}-[0-9]{2}-[0-9]{2}"
        return applyPredicateOnRegex(regexStr: dobRegx)
    }
    func applyPredicateOnRegex (regexStr: String) -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
}
