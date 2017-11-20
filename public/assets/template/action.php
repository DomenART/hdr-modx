<?php
if (empty($_REQUEST['action'])) {
	die('Access denied');
}

// Подключаем
define('MODX_API_MODE', true);
require '../../index.php';

switch ($_REQUEST['action']) {
    case 'ticket/like':
        $modx->lexicon->load('tickets:default');

        $id = $_REQUEST['id'];
        $value = $_REQUEST['value'];
        $modx->getRequest();
        $ip = $modx->request->getClientIp();

        if (empty($id)) {
            $response = array(
                'success' => false,
                'message' => $modx->lexicon('tickets_err_unknown')
            );
            break 1;
        }

        if ($modx->getCount('TicketVote', array(
            'id' => $id, 
            'createdby' => session_id(), 
            'class' => 'Ticket'
        ))) {
            $response = array(
                'success' => false,
                'message' => $modx->lexicon('ticket_err_vote_already')
            );
            break 1;
        }

        if (!$ticket = $modx->getObject('modResource', $id)) {
            $response = array(
                'success' => false,
                'message' => $modx->lexicon('ticket_err_ticket')
            );
            break 1;
        }

        /*if ($ticket->createdby == $modx->user->id) {
            $response = array(
                'success' => false,
                'message' => $modx->lexicon('ticket_err_vote_own')
            );
            break 1;
        }*/

        $vote = $modx->newObject('TicketVote');
        $vote->set('id', $ticket->id);
        $vote->set('owner', $ticket->createdby);
        $vote->set('class', 'Ticket');
        $vote->set('value', $value);
        $vote->set('ip', $ip['ip']);
        $vote->set('createdon', date('Y-m-d H:i:s'));
        $vote->set('createdby', session_id());
        $vote->save();


        if ($ticket instanceof Ticket) {
            $rating = $ticket->getRating();
        } else {
            $rating = array('rating' => 0, 'rating_plus' => 0, 'rating_minus' => 0);

            $q = $this->modx->newQuery('TicketVote', array('id' => $ticket->id, 'class' => 'Ticket'));
            $q->select('value');
            $tstart = microtime(true);
            if ($q->prepare() && $q->stmt->execute()) {
                $modx->startTime += microtime(true) - $tstart;
                $modx->executedQueries++;
                $rows = $q->stmt->fetchAll(PDO::FETCH_COLUMN);
                foreach ($rows as $value) {
                    $rating['rating'] += $value;
                    if ($value > 0) {
                        $rating['rating_plus'] += $value;
                    } elseif ($value < 0) {
                        $rating['rating_minus'] += $value;
                    }
                }
                $ticket->setProperties($rating, 'tickets', true);
                $ticket->save();
            }
        }

        $response = array(
            'success' => true,
            'message' => '',
            'rating' => $rating
        );

        break;
}

if (is_array($response)) {
    $response = $modx->toJSON($response);
}

@session_write_close();
exit($response);