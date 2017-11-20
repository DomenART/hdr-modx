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

    updateClip(coords) {
        coords = coords || this.clipCoords()
        this.afterImage.style.clip = "rect(0, " + coords.x + "px, " + coords.y + "px, 0)"
        this.setState({
            hideBeforeLabel: coords.x > this.container.offsetWidth - this.beforeLabel.offsetWidth,
            hideAfterLabel: this.afterLabel.offsetWidth > coords.x
        })
    }

    clipCoords() {
        let left = this.handle.getBoundingClientRect().left - this.container.getBoundingClientRect().left

        return {
            x: left + (this.handle.offsetWidth / 2),
            y: this.state.height
        }
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

        this.updateClip({
            x: left,
            y: this.state.height
        })
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
                <div class="comprasion__arrows">
                    <span></span>
                    <span></span>
                </div>
                <figure ref={el => this.container = el} class="comprasion" style={{ width: this.state.width + 'px', height: this.state.height + 'px' }}>
                    <div ref={el => this.beforeImage = el} class="comprasion__before" style={{ backgroundImage: 'url(' + this.props.before.image + ')' }}>
                    </div>

                    <div ref={el => this.afterImage = el} class="comprasion__after" style={{ backgroundImage: 'url(' + this.props.after.image + ')' }}>
                    </div>
                    <span 
                    ref={el => this.beforeLabel = el} 
                    class="comprasion__label comprasion__label--before" 
                    style={{ visibility: this.state.hideBeforeLabel ? 'hidden' : 'visible' }}>
                        {this.props.before.label}
                    </span>

                    <span 
                    ref={el => this.afterLabel = el} 
                    class="comprasion__label comprasion__label--after" 
                    style={{ visibility: this.state.hideAfterLabel ? 'hidden' : 'visible' }}>
                        {this.props.after.label}
                    </span>

                    <span ref={el => this.handle = el} class="comprasion__handle" onMouseDown={this.down}></span>
                </figure>
            </div>
        )
    }
}

export default Comprasion