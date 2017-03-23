
使用method swizzling让Array、Dictionary可以处理空值，在插入或设置空值时也不会崩溃。详见: http://www.jianshu.com/p/c89b2716d60d

主要使用method-swizzling技术，其中运用runtime的知识 class_getInstanceMethod，method_exchangeImplementations!
