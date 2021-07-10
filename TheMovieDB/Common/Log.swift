//
//  Log.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation
import os.log

/// https://www.avanderlee.com/workflow/oslog-unified-logging/
final class Log {
    static func error(_ message: String) {
        os_log("%@", log: .default, type: .error, message)
    }

    static func debug(_ message: String) {
        os_log("%@", log: .default, type: .debug, message)
    }

    static func info(_ message: String) {
        os_log("%@", log: .default, type: .info, message)
    }
}
