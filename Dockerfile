FROM node:20.17.0-bookworm-slim

WORKDIR /app

COPY package.json ./

RUN npm set registry https://registry.npmjs.org/
RUN npm config set fetch-retries 5
RUN npm install --unsafe-perm --verbose

# Copy the rest of the project files
COPY . .

# Expose the port
EXPOSE 8080

# Start the app
CMD ["npm", "start"]


# Build and Run Commands

# docker build -t holyunblocker .
# docker run -p 8080:8080 holyunblocker
