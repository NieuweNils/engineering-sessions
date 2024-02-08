from flask import Flask, request, jsonify
import psycopg2

app = Flask(__name__)

# Database configuration
DB_NAME = 'grocer'
DB_USER = 'DonQuijote'
DB_PASSWORD = 'AJungleOfVolume!'
DB_HOST = 'postgres-service'
DB_PORT = '5432'


# Database connection
def get_db_connection():
    conn = psycopg2.connect(
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT
    )
    return conn


# Create a new apple record
@app.route('/create', methods=['POST'])
def create_apple():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        data = request.get_json()
        cur.execute("INSERT INTO apples (circumference, seeds) VALUES (%s, %s)", (data['circumference'], data['seeds']))
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({'message': 'Apple record created successfully'}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500


# Read all apple records
@app.route('/read', methods=['GET'])
def read_apples():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT * FROM apples")
        apples = cur.fetchall()
        cur.close()
        conn.close()
        return jsonify({'apples': apples}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500


# Update an apple record
@app.route('/update/<int:id>', methods=['PUT'])
def update_apple(id):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        data = request.get_json()
        cur.execute("UPDATE apples SET circumference=%s, seeds=%s WHERE id=%s", (data['circumference'], data['seeds'], id))
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({'message': 'Apple record updated successfully'}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500


# Delete an apple record
@app.route('/delete/<int:id>', methods=['DELETE'])
def delete_apple(id):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("DELETE FROM apples WHERE id=%s", (id,))
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({'message': 'Apple record deleted successfully'}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
