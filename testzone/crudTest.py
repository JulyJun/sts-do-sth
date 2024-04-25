from dash import Dash, html, dcc, Input, Output, callback
from dash.exceptions import PreventUpdate
import mysql.connector as sql

app = Dash(__name__)

app.layout = html.Div([
    html.Fieldset([
        html.Label('Text Input: '),
        dcc.Input(placeholder='result_id', type='text'),
        dcc.Input(placeholder='floor_reached', type='text'),
        dcc.Input(placeholder='playtime', type='text'),
        dcc.Input(placeholder='score', type='text'),
        dcc.Input(placeholder='damage_taken_total', type='text'),
        dcc.Dropdown(['IRONCLAD', 'SILENT', 'DEFACT', 'WATCHER', 'MODE'], 'IRONCLAD', id='char_chosen_field'),
        dcc.Input(placeholder='gold', type='text'),
        dcc.Dropdown(['True', 'False'], 'False', id='victory_field'),
        dcc.Input(placeholder='relics_obtained', type='text'),
        html.Button('insert', id='sql_insert'),
        html.Br(),
        html.Div(id="query_result")
    ])
])

@callback(
    Output('query_result', 'children'),
    Input('sql_insert', 'n_clicks')
)
def click_test(n_clicks):
    if n_clicks is None:
        raise PreventUpdate
    else:
        return "success!"

if __name__ == '__main__':
    app.run(debug=True)
