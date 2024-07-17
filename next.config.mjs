/** @type {import('next').NextConfig} */
 
const nextConfig = {
  output: 'standalone',
    experimental: {
      ppr: 'incremental',
    },
  };
   
  export default nextConfig;