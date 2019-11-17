import React, {Component} from 'react';
import {
     StyleSheet,
     FlatList,
     ActivityIndicator,
     Image,
     TouchableHighlight,
     Text,
     View
    } from 'react-native';
import Icon from "react-native-vector-icons/Ionicons";

export default class HomeScreen extends Component {

  constructor(props) {
      super(props)
      this._reloadData = this._reloadData.bind(this);
      this.state = {
          isLoading: true
      }
  }

  async componentDidMount() {
      this.props.navigation.setParams({ reloadData: this._reloadData });
      this._reloadData();
  }

  async _reloadData() {
    this.setState({
        isLoading: true,
        dataSource: null
      });
    let photos = await this._getPhotosFromApi();
    this.setState({
      isLoading: false,
      dataSource: photos
    });
  }

  static navigationOptions = ({ navigation }) => {
    return {headerTitle: 'Home',
        headerRight: () => (
            <Icon.Button
                name="ios-refresh"
                backgroundColor='transparent'
                onPress={navigation.getParam('reloadData')}
            />
        ),
    }
  };

  async _getPhotosFromApi() {
    try {
      let response = await fetch(
        'https://picsum.photos/v2/list?page=2&limit=50',
      );
      let photos = await response.json();
      return photos;
    } catch (error) {
      console.error(error);
    }
  }

  render() {
    const {navigate} = this.props.navigation;
    if (this.state.isLoading) {
        return (
        <View style={styles.container}>
            <ActivityIndicator
                size='large'
                animating={this.props.isLoading} />
            </View>
        )
    } else 
    return (
      <View style={styles.container}>
           <FlatList
           data={this.state.dataSource}
           renderItem={({item}) => {
             return(
             <TouchableHighlight onPress={() => navigate('Details', {
               photo: item
              })
              }>
                <View style={styles.item}>
                  <Image source={{uri: `https://picsum.photos/id/${item.id}/600/300`}}
                  style={styles.img}
                  />
                  <Text>{item.author}</Text>
                  </View>
                  </TouchableHighlight>
                  )
          }
        }
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center'
    },
    item: {
        flex: 1,
        height: 200,
        justifyContent: 'center',
        padding: 8,
    },
    img: {
        flex: 1,
        height: 200,
        marginBottom: 8
    }
})