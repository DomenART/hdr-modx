import React from 'react'
import moment from 'moment'
import queryString from 'query-string'

class Calendar extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            weekStartOn: 1,
            dayList: [],
            curYear: new Date().getFullYear(),
            curMonth: new Date().getMonth(),
            curDate: new Date().getDate()
        }

        this.prevMonth = this.prevMonth.bind(this)
        this.nextMonth = this.nextMonth.bind(this)
    }

    dayList() {
        let dateObj = new Date()
        let firstDay = new Date(this.state.curYear, this.state.curMonth, 1)
        let dayOfWeek = firstDay.getDay()
        // Calculate the offset based on the current date
        if (this.state.weekStartOn > dayOfWeek) {
            dayOfWeek = dayOfWeek - this.state.weekStartOn + 7
        } else if (this.state.weekStartOn < dayOfWeek) {
            dayOfWeek = dayOfWeek - this.state.weekStartOn
        } else {
            dayOfWeek = dayOfWeek - 1;
        }
        let startDate = new Date(firstDay)
        startDate.setDate(firstDay.getDate() - dayOfWeek)
        let item, days = [], tmpItem
        for (let i = 0; i < 42; i++) {
            item = new Date(startDate)
            item.setDate(startDate.getDate() + i)
            tmpItem = {
                date: this.dateFormat(item),
                day: item.getDate(),
                status: this.state.curMonth === item.getMonth()
            }
            for (let index in this.props.events) {
                if (tmpItem.date === index) {
                    tmpItem.events = this.props.events[index]
                }
            }
            days.push(tmpItem)
        }
        return days
    }

    dateFormat(dateObj) {
        return moment(dateObj).format("YYYY-MM-DD")
    }

    getCurrentDate() {
        return new Date(this.state.curYear, this.state.curMonth, this.state.curDate)
    }

    setCurrentDate(date) {
        let arr = date.format("YYYY/MM/D").split('/')

        this.setState({
            curYear: arr[0],
            curMonth: arr[1] - 1,
            curDate: arr[2]
        })
    }

    prevMonth() {
        this.setCurrentDate(moment(this.getCurrentDate()).subtract(1, 'months'))
    }

    nextMonth() {
        this.setCurrentDate(moment(this.getCurrentDate()).add(1, 'months'))
    }

    loadEvents(date) {
        if (date.events) {
            let parsed = queryString.parse(location.search)
            parsed.date = date.date
            location.search = queryString.stringify(parsed)
        }
    }

    componentDidMount() {
        if (this.props.date) {
            this.setCurrentDate(moment(this.props.date))
        }
    }

    render() {
        const list = this.dayList().map((item) => {
            let classes = ['calendar-grid__item']

            if (item.events) classes.push('calendar-grid__item--events')
            if (!item.status)
                classes.push('calendar-grid__item--inactive')
            else
                classes.push('calendar-grid__item--active')
            if (item.date === this.dateFormat(new Date())) classes.push('calendar-grid__item--today')

            return (
                <div
                    key={item.date}
                    className={classes.join(' ')}
                    onClick={() => this.loadEvents(item)}>
                    {item.day}
                </div>
            )
        })

        return (
            <div className="calendar">
                <div className="calendar-header">
                    <div className="calendar-header__left" onClick={this.prevMonth}>&nbsp;</div>
                    <div className="calendar-header__title">
                        {moment(this.getCurrentDate()).format("MMMM YYYY")}
                    </div>
                    <div className="calendar-header__right" onClick={this.nextMonth}>&nbsp;</div>
                </div>
                <div className="calendar-grid uk-clearfix">
                    {list}
                </div>
            </div>
        )
    }
}

export default Calendar