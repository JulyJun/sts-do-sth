from dash import Dash, html, dcc, Input, Output, callback
from dash.exceptions import PreventUpdate
import mysql.connector

# parameters: https://dash.plotly.com/reference
app = Dash(__name__)

app.layout = html.Div([
    html.Label('Text Input: '),
    html.Fieldset([
        dcc.Input(placeholder='result_id', id='result', type='text'),
        dcc.Input(placeholder='floor_reached', id='floor_reached', type='text'),
        dcc.Input(placeholder='playtime', id='playtime', type='text'),
        dcc.Input(placeholder='score', id='score', type='text'),
        dcc.Input(placeholder='damage_taken_total', id='damage_taken_total', type='text'),
        dcc.Dropdown(['IRONCLAD', 'SILENT', 'DEFACT', 'WATCHER', 'MODE'], 'IRONCLAD', id='char_chosen_field'),
        dcc.Input(placeholder='gold', id='gold', type='text'),
        dcc.Dropdown(['True', 'False'], 'False', id='victory_field'),
        dcc.Input(placeholder='relics_obtained', id='relics_obtained', type='text'),
        html.Button('Submit', id='sql_insert', n_clicks=0),
        html.Br(),
        html.Br(),
        html.Div(id="query_result")
    ], id='field'),
    html.Div(id='test')
])


# MySQL connection setting
mydb = mysql.connector.connect(
        host= 'localhost',
        user= 'root',
        password= '@Autopassword',
        database= 'SlayTheSpire',
        raise_on_warnings= True
)

@callback(
    Output('query_result', 'children'),
    Input('sql_insert', 'n_clicks'),
    Input('result', 'value'),
    Input('floor_reached', 'value'),
    Input('playtime', 'value'),
    Input('score', 'value'),
    Input('damage_taken_total', 'value'),
    Input('char_chosen_field', 'value'),
    Input('gold', 'value'),
    Input('victory_field', 'value'),
    Input('relics_obtained', 'value')
)
def checkData(n_clicks, result, floor_reached, playtime, score, damage_taken_total, char_chosen, gold, victory, relics_obtained):
    if n_clicks == 0:
        raise PreventUpdate
    else:
        victory = 0 if victory == 'False' else 1
        mycursor = mydb.cursor()
        insert_query = """INSERT INTO result (result_id, floor_reached, playtime, score, damage_taken_total, character_chosen, gold, victory, relics_obtained)
VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"""
        data = (result, floor_reached, playtime, score, damage_taken_total, char_chosen, gold, victory, relics_obtained)
        mycursor.execute(insert_query, data)
        mydb.commit()
        return "Data inserted successfully."


if __name__ == '__main__':
    app.run(debug=True)
