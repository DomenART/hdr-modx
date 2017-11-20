import React from 'react'
import Comprasion from './comprasion'

class ComprasionHome extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            main: 0,
            second: 1
        }

        this.setMain = this.setMain.bind(this)
    }

    setMain(index) {
        if (index == this.state.main) return

        this.setState((prevState, props) => ({
            second: prevState.main,
            main: index
        }))
    }


    render() {
        const list = this.props.images.map((item, index) => (
            <div key={item.id} class={'comprasion-thumb' + (this.state.main == index && ' uk-active')} onClick={() => this.setMain(index)}>
                <div class="comprasion-thumb__image"><img src={item.image} alt="" /></div>
                <div class="comprasion-thumb__name">{item.label}</div>
            </div>
        ))

        return (
            <div>
                <header class="comprasion__header uk-flex uk-flex-between uk-flex-middle">
                    <div class="comprasion__title">Какой стиль интерьера выберешь ты?</div>
                    <a class="comprasion__select" href={this.props.images[this.state.second].url}>Выберите свой интерьер</a>
                </header>

                <Comprasion before={this.props.images[this.state.main]} after={this.props.images[this.state.second]} />

                <div class="comprasion-thumbs uk-grid uk-child-width-1-2 uk-child-width-1-4@s" uk-grid>
                    {list}
                </div>
            </div>
        )
    }
}

export default ComprasionHome