import React, {Component} from 'react';
import { StyleSheet, Alert, Image, Text, View } from 'react-native';
import ImagePicker from 'react-native-image-picker';
import { RaisedTextButton as Button } from 'react-native-material-buttons';

export default class DetailsScreen extends Component {

    static navigationOptions = {
        title: 'Details',
    };

    _onPressButton = (param) => {
        Alert.alert(
            'Photo Source URL',
            param,
            [
              {text: 'OK', onPress: () => console.log('OK Pressed')},
            ],
            {cancelable: false},
          );
    }

    _takePicture = async() => {
        ImagePicker.showImagePicker({}, (response) => {
            console.log('Response = ', response);
          });
      };

    render() {

        const { navigation } = this.props;
        const photo = navigation.getParam('photo');
        return (
        <View style={styles.container}>
            <Image
                    source={{uri: `https://picsum.photos/id/${photo.id}/600/300`}}
                    style={styles.img}
                    />
            <Text style={styles.txt}>{photo.author}</Text>
            <View style={styles.horizontalContainer}>
                <Button
                onPress={() => this._onPressButton(photo.url)}
                title="Show source"
                />
                <Button
                onPress={() => this._takePicture()}
                title="Take Photo"
                />
            </View>
        </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'flex-start',
    },
    horizontalContainer: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'space-around',
        marginTop: 40,
    },
    img: {
        height: 200,
    },
    txt: {
        padding: 8,
        fontSize: 32,
        fontWeight: '400'
    },
})