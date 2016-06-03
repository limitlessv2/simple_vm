sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
wget --no-check-certificate https://github.com/aglover/ubuntu-equip/raw/master/equip_base.sh && bash equip_base.sh

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update -y
sudo apt-get install oracle-java8-installer -y
sudo apt-get install ant -y

wget https://archive.apache.org/dist/kafka/kafka-0.8.0-beta1-src.tgz
mkdir /usr/local/kafka
tar -zxvf kafka-0.8.0-beta1-src.tgz
cd kafka-0.8.0-beta1-src
./sbt update
./sbt package
./sbt assembly-package-dependency
cd 
mv kafka-0.8.0-beta1-src /usr/local/kafka

cd 

wget http://apache.claz.org/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
mkdir /usr/local/zookeeper
tar -zxvf zookeeper-3.4.6.tar.gz --directory /usr/local/zookeeper
cp /usr/local/zookeeper/zookeeper-3.4.6/conf/zoo_sample.cfg /usr/local/zookeeper/zookeeper-3.4.6/conf/zoo.cfg

cd    