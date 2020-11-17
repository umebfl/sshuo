//
//  Log.swift
//  sshuo
//
//  Created by ume on 2020/11/17.
//

import SwiftyBeaver

let log = SwiftyBeaver.self

func LogInit() {
    
    #if DEBUG
        // 输出到日志文件
        let file = FileDestination()
        log.addDestination(file)

        file.format = "$Dyy-MM-dd HH:mm:ss.SSS $d $C $L $c: $M"
        file.logFileURL = URL(fileURLWithPath: "/tmp/app.log")
//        file.minLevel = Level.info
    
        log.verbose("\n\n\n\n启动日志:")
    
        let console = ConsoleDestination()
        console.format = "$Dyy-MM-dd HH:mm:ss.SSS $d $C $L $c: $M"
        log.addDestination(console)
    #else
        // 发送错误日志到服务器

    #endif
    
    
    // add log destinations. at least one is needed!
//    let console = ConsoleDestination()  // log to Xcode Console
     // log to default swiftybeaver.log file
//    let cloud = SBPlatformDestination(appID: "foo", appSecret: "bar", encryptionKey: "123") // to cloud

    // use custom format and set console output to short time, log level & message

    // or use this for JSON output: console.format = "$J"

    // add the destinations to SwiftyBeaver
//    log.addDestination(console)
    
//    log.addDestination(cloud)

//    console.format = "$DHH:mm:ss$d $L $M"
//    file.format = "$ Dyyyy-MM-dd HH：mm：ss.SSS $ d $ C $ L $ c：$ M"
    

//    file2.minLevel = Level.info

//    // Now let’s log!
//    log.verbose("not so important")  // prio 1, VERBOSE in silver
//    log.debug("something to debug")  // prio 2, DEBUG in green
//    log.info("a nice information")   // prio 3, INFO in blue
//    log.warning("oh no, that won’t be good")  // prio 4, WARNING in yellow
//    log.error("ouch, an error did occur!")  // prio 5, ERROR in red
//
//    // log anything!
//    log.verbose(123)
//    log.info(-123.45678)
//    log.warning(Date())
//    log.error(["I", "like", "logs!"])
//    log.error(["name": "Mr Beaver", "address": "7 Beaver Lodge"])
//
//    // optionally add context to a log message
//
//    log.debug("age", context: 123)  // "DEBUG: age 123"
//    log.info("my data", context: [1, "a", 2]) // "INFO: my data [1, \"a\", 2]"
}

