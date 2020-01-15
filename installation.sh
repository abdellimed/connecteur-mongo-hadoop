wget -P /tmp/ https://github.com/mongodb/mongo-hadoop/archive/r1.5.1.tar.gz
mkdir mongo-hadoop
tar -xvzf /tmp/r1.5.1.tar.gz -C mongo-hadoop --strip-components=1

# Now build the mongo-hadoop-spark jars
cd mongo-hadoop
./gradlew jar
cd ..
cp mongo-hadoop/spark/build/libs/mongo-hadoop-spark-*.jar /lib/
cp mongo-hadoop/build/libs/mongo-hadoop-*.jar /lib/

#2)install pymongo_spark

cd mongo-hadoop/spark/src/main/python
python setup.py install
cd $PROJECT_HOME
cp mongo-hadoop/spark/src/main/python/pymongo_spark.py /lib/
export PYTHONPATH=$PYTHONPATH:$PROJECT_HOME/lib
