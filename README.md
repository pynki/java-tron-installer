# java-tron-installer

## How to use
### Get the code
Clone this repository and the [java-tron](https://github.com/tronprotocol/java-tron) repository
```
git clone --recursive https://github.com/pynki/java-tron-installer
```

The [java-tron](https://github.com/tronprotocol/java-tron) repository will be cloned as a submodule to `./java-tron`. Please see the `./.gitmodules` file for details.

### Run the installer script

Execute the script 
```
sudo ./java-tron-installer
```

## WARNING

1. The installer script right now sets the oracle java via java alternatives. This might cause conflicts with software that depends on openjdk-XY. Will fix it soon. 

2. Builds the .jar file right now via `./gradlew clean shadowJar`. Working on maing it switchable with `./grandlew build`.
