import React, { Fragment } from 'react'
import { ActionCable } from 'react-actioncable-provider'

const Cable = ({ games, handleReceivedMessage }) => {
	return (
		<Fragment>
			{games.map(game => {
				return (
					<ActionCable 
						key={game.id}
						channel={ {channel: 'BlocksChannel', game: game.id } }
						onReceived={handleReceivedMessage}
					/>
				)
			})}
		</Fragment>
	)
}

export default Cable