#!/usr/bin bash

if [ -d classes ]; then
    rm -rf classes;
fi
#创建输出目录
mkdir classes

#先编译注解处理器相关的类，并且-d指定输出到classes文件夹
javac -encoding UTF-8 -cp /Library/Java/JavaVirtualMachines/jdk1.8.0_341.jdk/Contents/Home/lib/tools.jar com/hinotoyk/jsr269/*.java -d classes/

#-cp 指定class路径（运行时用全限定类名） -processor 即指定用上面编译出来的注解类去编译测试类，并且class文件也指定到classes文件夹
javac -cp classes -processor com.hinotoyk.jsr269.GetterProcessor,com.hinotoyk.jsr269.SetterProcessor com/hinotoyk/test/TestDemo.java -d classes/

#-cp 指定class路径，然后运行
java -cp classes com.hinotoyk.test.TestDemo
