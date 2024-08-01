import streamlit as st
from pymongo import MongoClient
import pandas as pd

client = MongoClient('mongodb://mongodb:27017/')
db = client.db_listing
listings_collection = db.listing_sql


def get_data():
    listings = listings_collection.find()
    data = []
    for listing in listings:
        listing['_id'] = str(listing['_id'])
        if 'price' in listing and listing['price'] is not None:
            listing['price'] = float(listing['price'].to_decimal())
        if 'cleaning_fee' in listing and listing['cleaning_fee'] is not None:
            listing['cleaning_fee'] = float(
                listing['cleaning_fee'].to_decimal())
        if 'extra_people' in listing and listing['extra_people'] is not None:
            listing['extra_people'] = float(
                listing['extra_people'].to_decimal())
        if 'bathrooms' in listing and listing['bathrooms'] is not None:
            listing['bathrooms'] = float(listing['bathrooms'].to_decimal())
        data.append(listing)
    return pd.DataFrame(data)


st.title("Les visualisations des données de Airbnb Listings")

data = get_data()

st.subheader("Data about listing")
st.write(data.head())

if 'amenities' in data.columns:
    amenities = data['amenities'].explode().unique().tolist()
    selected_amenities = st.multiselect('Select some amenities', amenities)

    if selected_amenities:
        filtered_data = data[data['amenities'].apply(
            lambda x: any(item in x for item in selected_amenities))]
        st.subheader("Filtered data")
        st.write(filtered_data)
    else:
        st.write("Please, chose amenities for filter data")

st.subheader("Statistic")

if 'price' in data.columns:
    average_price = data['price'].mean()
    st.metric("Average price", f"${average_price:.2f}")

if 'number_of_reviews' in data.columns:
    average_reviews = data['number_of_reviews'].mean()
    st.metric("Average nb of reviews", f"{average_reviews:.2f}")

if 'price' in data.columns:
    st.subheader("Répartition des prix")
    st.bar_chart(data['price'])

if 'number_of_reviews' in data.columns:
    st.subheader("Répartition of nb reviews")
    st.bar_chart(data['number_of_reviews'])

if 'bedrooms' in data.columns:
    st.subheader("Distribution of the number of bedrooms")
    st.bar_chart(data['bedrooms'])

if 'bathrooms' in data.columns:
    st.subheader("Distribution of the number of bathrooms")
    st.bar_chart(data['bathrooms'])

if 'accommodates' in data.columns:
    st.subheader("Accommodates")
    st.bar_chart(data['accommodates'])
