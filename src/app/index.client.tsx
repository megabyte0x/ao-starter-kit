import './styles/index.css.js'

import { hydrateRoot } from 'react-dom/client'
import { RouterProvider, createHashRouter } from 'react-router-dom'
import { ConfigProvider, getConfig } from './hooks/useConfig.js'
import { routes } from './routes.js'
import { hydrateLazyRoutes } from './utils/hydrateLazyRoutes.js'
import { removeTempStyles } from './utils/removeTempStyles.js'

hydrate()

async function hydrate() {
  const basePath = getConfig().basePath

  await hydrateLazyRoutes(routes, basePath)
  removeTempStyles()

  const router = createHashRouter(routes, { basename: basePath });
    
  hydrateRoot(
    document.getElementById('root')!,
    <ConfigProvider>
      <RouterProvider router={router} />
    </ConfigProvider>,
  )
}
