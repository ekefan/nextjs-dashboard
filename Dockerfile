# Use the official Node.js image.
FROM node:22-alpine3.19

# Create and change to the app directory.
WORKDIR /usr/src/app

# Install necessary packages.
RUN apk add --no-cache python3 g++ make curl

# Install pnpm globally.
RUN npm install -g pnpm

# Copy package.json and pnpm-lock.yaml to the container.
COPY package.json pnpm-lock.yaml ./

# Install dependencies.
RUN pnpm install --frozen-lockfile --prod

# Copy the rest of the application code to the container.
COPY . .

# Ensure network access for fetching external resources.
RUN curl https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap
RUN curl https://fonts.googleapis.com/css2?family=Lusitana:wght@400;700&display=swap

# Build the Next.js application.
RUN pnpm run build

# Expose the port the app runs on.
EXPOSE 3000

# Start the Next.js application.
CMD ["pnpm", "start"]
