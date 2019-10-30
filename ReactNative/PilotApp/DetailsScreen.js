import React, {Component} from 'react';
import { StyleSheet, Alert, Button, Image, Text, View } from 'react-native';

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
            <Button
            style={styles.buttonContainer}
            onPress={() => this._onPressButton(photo.url)}
            title="Show source"
          />
        </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'flex-start',
    },
    img: {
        height: 200,
    },
    txt: {
        padding: 8,
        fontSize: 32,
        fontWeight: '400'
    },
    buttonContainer: {
        margin: 20
    },
})