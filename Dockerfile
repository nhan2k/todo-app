# Use an official Node.js runtime as the base image
FROM node:18.18.0-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package.json pnpm-lock.yaml /app/

# Install PNPM globally
RUN npm install -g pnpm@8.8.0

# Install project dependencies using PNPM
RUN pnpm install

# Copy the rest of the application code to the container
COPY . /app/

# Build the Next.js application
RUN pnpm run build

# Expose the port that the application will run on
EXPOSE 3000

# Start the Next.js application
CMD ["pnpm", "run", "start"]
