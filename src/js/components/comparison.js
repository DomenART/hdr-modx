import React from 'react'

class Comprasion extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            hideBeforeLabel: true,
            hideAfterLabel: true,
            baseWidth: 1200,
            baseHeight: 460,
            width: 1200,
            height: 460,
            switcher: null
        }

        this.down = this.down.bind(this)
        this.move = this.move.bind(this)
        this.up = this.up.bind(this)
        this.resize = this.resize.bind(this)
    }

    updateClip(x) {
        x = x || this.getHandleCenter()

        this.afterImage.style.clip = `rect(0, ${this.state.width}px, ${this.state.height}px, ${x}px)`

        this.setState({
            hideBeforeLabel: x < this.beforeLabel.offsetWidth,
            hideAfterLabel: this.container.offsetWidth - x < this.afterLabel.offsetWidth
        })
    }

    getHandleCenter() {
        let left = this.handle.getBoundingClientRect().left - this.container.getBoundingClientRect().left
        left += (this.handle.offsetWidth / 2)
        return left
    }
    
    getParentSwitcher(el) {
        if (el.className === undefined) return false
        if (el.className.indexOf('uk-switcher') > -1) return el

        return this.getParentSwitcher(el.parentNode)
    }

    reset() {
        this.handle.style.left = ''
        this.updateClip()
    }

    resize() {
        this.setState({
            height: this.container.offsetWidth / this.state.baseWidth * this.state.baseHeight
        })
        this.reset()
    }

    down() {
        document.addEventListener('mousemove', this.move)
        document.addEventListener('mouseup', this.up)
    }

    up() {
        document.removeEventListener('mousemove', this.move)
        document.removeEventListener('mouseup', this.up)
    }

    move(e) {
        let left = e.clientX - this.container.offsetLeft

        if (left < 0) left = 0
        if (left > this.container.offsetWidth) left = this.container.offsetWidth

        this.handle.style.left = left + 'px'

        this.updateClip(left)
    }

    componentDidMount() {
        if (this.switcher = this.getParentSwitcher(this.container)) {
            this.switcher.addEventListener('shown', this.resize)
        }

        this.reset()

        window.addEventListener('resize', this.resize)
    }

    render() {
        return (
            <div>
                <div className="comprasion__arrows">
                    <span />
                    <span />
                </div>
                <figure ref={el => this.container = el} className="comprasion" style={{ width: this.state.width + 'px', height: this.state.height + 'px' }}>
                    <div ref={el => this.beforeImage = el} className="comprasion__before" style={{ backgroundImage: 'url(' + this.props.before.image + ')' }}>
                    </div>

                    <div ref={el => this.afterImage = el} className="comprasion__after" style={{ backgroundImage: 'url(' + this.props.after.image + ')' }}>
                    </div>

                    <span 
                    ref={el => this.beforeLabel = el}
                    className="comprasion__label comprasion__label--before"
                    style={{ visibility: this.state.hideBeforeLabel ? 'hidden' : 'visible' }}>
                        {this.props.before.label}
                    </span>

                    <span 
                    ref={el => this.afterLabel = el}
                    className="comprasion__label comprasion__label--after"
                    style={{ visibility: this.state.hideAfterLabel ? 'hidden' : 'visible' }}>
                        {this.props.after.label}
                    </span>

                    <span ref={el => this.handle = el} className="comprasion__handle" onMouseDown={this.down} />
                </figure>
            </div>
        )
    }
}

export default Comprasion