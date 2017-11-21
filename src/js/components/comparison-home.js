import React from 'react'
import Comparison from './comparison'

class ComparisonHome extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            main: 0,
            second: 1
        }

        this.setMain = this.setMain.bind(this)
    }

    setMain(index) {
        if (index === this.state.main) return

        this.setState((prevState, props) => ({
            second: prevState.main,
            main: index
        }))
    }


    render() {
        const list = this.props.images.map((item, index) => (
            <div key={item.id} className={'comprasion-thumb' + (this.state.main === index && ' uk-active')} onClick={() => this.setMain(index)}>
                <div className="comprasion-thumb__image"><img src={item.image} alt="" /></div>
                <div className="comprasion-thumb__name">{item.label}</div>
            </div>
        ))

        return (
            <div>
                <header className="comprasion__header uk-flex uk-flex-between uk-flex-middle">
                    <div className="comprasion__title">Какой стиль интерьера выберешь ты?</div>
                    <a className="comprasion__select" href={this.props.images[this.state.second].url}>Выберите свой интерьер</a>
                </header>

                <Comparison before={this.props.images[this.state.main]} after={this.props.images[this.state.second]} />

                <div className="comprasion-thumbs uk-grid uk-child-width-1-2 uk-child-width-1-4@s" uk-grid>
                    {list}
                </div>
            </div>
        )
    }
}

export default ComparisonHome